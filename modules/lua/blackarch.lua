#!/usr/bin/lua
local Module = {} ;

local shell = os.getenv("SHELL")
local pager = (os.getenv("PAGER") or "less")
local manpager = os.getenv("MANPAGER")
local terminal = "uxterm"
local ba_script= os.getenv("CODE").."/".."/sh/blackarch/exec_util.sh"
Module.awesome = {}

local jstring = require("jstring") ;
local jtable  = require("jtable") ;

function awesome_utilCommand(terminal, ba_script, util)
	return terminal.." -e 'sh "..ba_script.." "..util
end

function Module.getUtilList(path)
	-- Returns util list in table looking like [category, util].
	t = {}
	lines = io.lines(path)
	for line in lines do
		words = jstring.split(line)
		util = words[1]
		hcat = words[2]
		if hcat == nil then
			hcat = "Nope"
		end
		--print(words[1], words[2])
		if t[hcat] == nil then
			t[hcat] = {}
		end
		table.insert(t[hcat], util)
	end
	return t
end

function awesome_getUtilBranch(t)
	-- Returns branch with branch_num max amount of items in one menu.
	if #t <= branch_num then
		return t
	end
	
	tr = {}
	for i=0, #t//branch_num do
		table.insert(
			tr,
			{
				tostring(i),
				jtable.slice(
					t,
					branch_num*i+1,
					branch_num*(i+1)
				)
			}
		)
	end

	return awesome_getUtilBranch(tr)
end

function Module.awesome.getUtilList(path, n, terminal, ba_script)
	branch_num = n or 25
	t = Module.getUtilList(path)
	-- Generating menu with command to execute when call util from menu.
	cat = {}
	for i1, hcat in pairs(t) do
		--print(i1)
		for i2, util in pairs(hcat) do
			--print("", i2, util)
			t[i1][i2] = {util, awesome_utilCommand(terminal, ba_script, util )}
			--print("","", t[i1][i2])
		end
	end
	-- Generating branches.
	local ret = {}
	for hcat, hcat_utils in pairs(t) do
		table.insert(ret, {hcat, awesome_getUtilBranch(hcat_utils)})
		--print(awesome_getUtilBranch(hcat_utils))
		for i1, util in pairs(hcat_utils) do
			--print("", util)
			for i2, x in pairs(util) do
				--print("","", x)
			end
		end
	end
	return {"BlackArch", ret}
end

return Module
