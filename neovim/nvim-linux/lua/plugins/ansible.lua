return {
  {
    "mfussenegger/nvim-ansible",
    ft = { "yaml.ansible" },
    keys = {
      {
        "<leader>ar",
        function()
          require("ansible").run()
        end,
        desc = "Ansible Run Playbook/Role",
        ft = "yaml.ansible",
      },
    },
  },
}
