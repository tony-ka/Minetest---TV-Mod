--[[
   tv Mod
   
   Copyright 2012 Tonyka
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
]]--

minetest.register_node("tv:off", {
	description = "TV",
	tile_images = {"tv_top.png","tv_top.png",
			"tv_side.png","tv_side.png",
			"tv_back.png","tv_front.png",
		},
	is_ground_content = true,
	paramtype2 = 'facedir',
	groups = {cracky=2,oddly_breakable_by_hand=1,},
	drop = 'tv:off',
	light_source = 12,
})

minetest.register_node("tv:chanell_1", {
	description = "TV",
	tile_images = {"tv_top.png","tv_top.png",
			"tv_side.png","tv_side.png","tv_back.png",{ name="chanell_1.png",
				animation={
				type="vertical_frames",
				aspect_w=40,
				aspect_h=40,
				length=1.0
			},
		},
	},
	is_ground_content = true,
	paramtype2 = 'facedir',
	groups = {cracky=2,oddly_breakable_by_hand=1,},
	drop = 'tv:off',
	light_source = 12,
})

minetest.register_node("tv:chanell_2", {
	description = "TV",
	tile_images = {"tv_top.png","tv_top.png",
			"tv_side.png","tv_side.png","tv_back.png",
			{ name="chanell_2.png",
				animation={
				type="vertical_frames",
				aspect_w=40,
				aspect_h=40,
				length=3.0
			},
		},
	},
	is_ground_content = true,
	paramtype2 = 'facedir',
	groups = {cracky=2,oddly_breakable_by_hand=1,},
	drop = 'tv:off',
	light_source = 12,
})

minetest.register_node("tv:chanell_3", {
	description = "TV",
	tile_images = {"tv_top.png","tv_top.png",
			"tv_side.png","tv_side.png","tv_back.png",
			{ name="chanell_3.png",
				animation={
				type="vertical_frames",
				aspect_w=40,
				aspect_h=40,
				length=6.0
			},
		},
	},
	is_ground_content = true,
	paramtype2 = 'facedir',
	groups = {cracky=2,oddly_breakable_by_hand=1,},
	drop = 'tv:off',
	light_source = 12,
})

local on_tv_puncher = function (pos, node, puncher)
	if node.name == "tv:off" then
		local dir = node["param2"]
		minetest.env:add_node(pos, {name="tv:chanell_1", paramtype2='none', param2=dir})
		nodeupdate(pos)
	elseif node.name == "tv:chanell_1" then
		local dir = node["param2"]
		minetest.env:add_node(pos, {name="tv:chanell_2", paramtype2='none', param2=dir})
		nodeupdate(pos)
	elseif node.name == "tv:chanell_2" then
		local dir = node["param2"]
		minetest.env:add_node(pos, {name="tv:chanell_3", paramtype2='none', param2=dir})
		nodeupdate(pos)
	elseif node.name == "tv:chanell_3" then
		local dir = node["param2"]
		minetest.env:add_node(pos, {name="tv:off", paramtype2='none', param2=dir})
		nodeupdate(pos)
    end
end

minetest.register_craft({
	output = 'tv:off',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot'},
	}
})

minetest.register_on_punchnode(on_tv_puncher)
