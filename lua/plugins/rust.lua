return {
	{
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
},
{
	'rayliwell/tree-sitter-rstml',
	dependencies = {"nvim-treesitter" },
	ft = "rust",
}
}
