return {
  { "niuiic/core.nvim" },
  {
    "niuiic/remote.nvim",
    config = function()
      require("remote").setup({
        config_file = "/home/lasim/sync/dotFiles/nvim/lua/plugins/remote/remote.json",
        log_file = "/home/lasim/sync/dotFiles/nvim/lua/plugins/remote/remote.log",
        unmount = function(path)
          return "umount " .. path
        end,
        disconnect_on_leave = true,
        on_each_to_connect = function() end,
        on_each_connected = function() end,
        on_each_to_disconnect = function() end,
        on_each_disconnected = function() end,
      })
    end,
  },
}
