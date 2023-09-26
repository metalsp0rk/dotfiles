local lsp = require('lsp-zero')
local util = require('lspconfig.util')
local configs = require('lspconfig.configs')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'bashls',
  'dockerls',
  'gopls',
  'pyright',
  'vimls',
  'yamlls',
  'jsonls',
  'svelte',
  'jdtls',
  'clangd',
  'helm_ls',
  'cmake',
  'rust_analyzer',
  'terraformls',
})

lsp.configure("yamlls", {
  settings = {
    yaml = {
      keyOrdering = false,
      validate = false,
    }
  }
})

lsp.configure("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
})


if not configs.helm_ls then
  configs.helm_ls = {
    default_config = {
      cmd = { "helm_ls", "serve" },
      filetypes = { "helm" },
      root_dir = function(fname)
        return util.root_pattern("Chart.yaml")(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
      end,
    },
  }
end

require('lspconfig').helm_ls.setup({
  cmd = { "helm_ls", "serve" },
  filetypes = { "helm" },
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j']  = cmp.mapping.select_next_item(cmp_select),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>']  = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }, {
    { name = 'buffer' },
  }),

})



-- Fix for undefined global 'vim'
lsp.nvim_workspace()


lsp.on_attach = function(client, bufnr)
  if vim.bo[bufnr].filetype == "helm" then
    vim.bo[bufnr].buftype = ""
    vim.diagnostic.disable(bufnr)
    client.name = "helm_ls"
  end
  if client.name == "yamlls" then
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      vim.diagnostic.disable(bufnr)
    end
  end
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {desc = "Go to definition", remap = false,  buffer = bufnr })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>gws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>gd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>gca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>grr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>grn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  -- TODO: add more LSP mappings
end

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

