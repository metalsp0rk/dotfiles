#!/usr/bin/env python3
import os
import tkinter as tk
from tkinter import messagebox
from tkinterdnd2_universal import DND_FILES, TkinterDnD
import fitz  # PyMuPDF
from PIL import Image
import io
from concurrent.futures import ThreadPoolExecutor, as_completed
import threading


# Thread-safe counter for progress
class ProgressTracker:
    def __init__(self):
        self.lock = threading.Lock()
        self.completed = 0
        self.total = 0
        self.errors = []

    def increment(self):
        with self.lock:
            self.completed += 1

    def add_error(self, error_msg):
        with self.lock:
            self.errors.append(error_msg)

    def get_progress(self):
        with self.lock:
            return self.completed, self.total, len(self.errors)


progress_tracker = ProgressTracker()


def extract_largest_image(page):
    """
    Extracts the largest embedded image from the page as PIL Image.
    Returns None if no images found.
    """
    images = page.get_images(full=True)
    if not images:
        return None

    largest_img = None
    largest_area = 0

    doc = page.parent
    for img_info in images:
        xref = img_info[0]
        base_image = doc.extract_image(xref)
        image_bytes = base_image["image"]

        # Open with PIL to get dimensions
        pil_img = Image.open(io.BytesIO(image_bytes))
        area = pil_img.width * pil_img.height

        if area > largest_area:
            largest_area = area
            largest_img = pil_img

    return largest_img


def process_single_pdf(pdf_path):
    """
    Process a single PDF file. Returns (success, error_message).
    """
    try:
        folder = os.path.dirname(pdf_path)
        pdf_name = os.path.splitext(os.path.basename(pdf_path))[0]

        doc = fitz.open(pdf_path)
        for page_number, page in enumerate(doc, start=1):
            img = extract_largest_image(page)

        if img:
            output_path = os.path.join(folder, f"{pdf_name}_page{page_number}.png")
            img.save(output_path, "PNG")

            doc.close()
            progress_tracker.increment()
            return (True, None)

    except Exception as e:
        error_msg = f"Failed to convert {os.path.basename(pdf_path)}: {str(e)}"
        progress_tracker.add_error(error_msg)
        progress_tracker.increment()
        return (False, error_msg)


def convert_pdfs(files):
    """
    Convert PDFs using thread pool for parallel processing.
    """
    files = root.tk.splitlist(files)
    pdf_files = [f for f in files if f.lower().endswith(".pdf")]

    if not pdf_files:
        messagebox.showwarning("No PDFs", "No PDF files found in selection.")
        return

    # Reset and initialize progress tracker
    progress_tracker.completed = 0
    progress_tracker.total = len(pdf_files)
    progress_tracker.errors = []

    progress_label.config(text=f"Processing: 0/{len(pdf_files)} files")


# Determine number of worker threads (use more threads for I/O-bound tasks)
# PDF processing is I/O-bound (disk reads/writes), so we can use more threads than CPU cores
max_workers = min(32, (os.cpu_count() or 4) * 4)


# Process PDFs in parallel
def run_processing():
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {executor.submit(process_single_pdf, pdf): pdf for pdf in pdf_files}

        for future in as_completed(futures):
            pass  # Progress is tracked in process_single_pdf


# Run processing in a separate thread so GUI doesn't freeze
threading.Thread(target=run_processing, daemon=True).start()

# Start progress updates
root.after(100, update_progress_label)

# TkinterDnD GUI
root = TkinterDnD.Tk()
root.title("PDF PNG (Multi-threaded)")
root.geometry("500x300")

label = tk.Label(
    root, text="Drag and drop PDF files here", width=40, height=8, bg="lightgray"
)
label.pack(expand=True, fill="both", padx=20, pady=20)

progress_label = tk.Label(root, text="Drag and drop PDF files here", fg="blue")
progress_label.pack(pady=10)

label.drop_target_register(DND_FILES)
label.dnd_bind("<<Drop>>", lambda event: convert_pdfs(event.data))

root.mainloop()
