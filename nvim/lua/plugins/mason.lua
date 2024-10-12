local langs = require("constants.langs")

return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    init = function()
      print("OK")
      local registry = require("mason-registry")
      registry.refresh(function()
        for _, value in ipairs(langs) do
          local packages = {
            value.server,
            value.linter,
            value.formatter
          }
          print("Test" .. value.server)
          for _, package in ipairs(packages) do
            if registry.has_package(package) then
              vim.cmd("MasonInstall " .. package)
            end
          end
        end
      end)
    end,
    config = true
  },
}
