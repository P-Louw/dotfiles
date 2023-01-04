-- Set after plugin on package path for requires from after folder.
local home_dir = os.getenv('HOME')
package.path = home_dir .. '/.config/nvim/after/plugin/?.lua;' .. package.path

