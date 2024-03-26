return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
    })

  end
}

--[[
https://www.youtube.com/watch?v=NJDu_53T_4M&ab_channel=Cretezy
ys - (you surround/add)
cs - (change surrounding)
ds - (delete surrounding)

# Adding surroundings
ys<motion><delimiter>
ysiw" - "hello"
ysa"( - ( "hello" )
ysiw( - ( hello )
Visual mode S{ - { hello }
hello there

# change surroundings
cs"' ("hello")
# delete surroundings
ds{ - {"hello"}

]]--
