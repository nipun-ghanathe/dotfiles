return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {
            map_c_h = true,
            map_c_w = true,
        },
    },

    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close_on_slash = true,
                },
            })
        end,
    },
}
