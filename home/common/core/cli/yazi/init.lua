require("git"):setup { order = 0 }
th.git = th.git or {}
th.git.modified_sign = " "
th.git.added_sign = " "
th.git.untracked_sign = " "
th.git.ignored_sign = " "
th.git.deleted_sign = " "
th.git.updated_sign = " "

function Linemode:size_and_mtime()
    local time = math.floor(self._file.cha.mtime or 0)
    if time == 0 then
        time = ""
    elseif os.date("%Y", time) == os.date "%Y" then
        time = os.date("%b %d %H:%M", time)
    else
        time = os.date("%b %d  %Y", time)
    end

    local size = self._file:size()
    return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end
