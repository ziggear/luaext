-- luaExt
-- by ziggear 2013.09.11

-- Table Extensions

table = table

function table.findtable(table,value)
        for k,v in pairs(table) do
                if (v == value) or (k == value) then
                        return true
                end
        end
        return false
end

function table.reverse(tab)
        local size = table.maxn(tab) + 1
        local newTable = {}
        for i,v in ipairs(tab) do
                newTable[size-i] = v
       	end
        return newTable
end

function table.tableurlencode(tab)
	local values = ''
    	for k,v in pairs(tab) do
        	values = values .. string.format("%s=%s&",k,v)
    	end
    	values = string.sub(values,1,string.len(values)-1)
	return values
end

-- File Management Extensions

file = {}

function file.pwd()
	local curPWD = os.getenv("PWD")
	return curPWD
end

function file.exist(filename)
	local curPWD = os.getenv("PWD")
	if curPWD == nil then
        return false
    end
	local fullpath = string.format("%s/%s",curPWD,filename)
	local f = io.open(fullpath)
	if f == nil then
       		return false
	end
	io.close(f)
    return true
end

function file.getfullpath(file)
    local curPWD = os.getenv("PWD")
	if curPWD == nil then
        return false
    end
	local fullpath = string.format("%s/%s",curPWD,file)
	return fullpath
end

return table, file
