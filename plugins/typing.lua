function solid(msg, matches)
local receiver = get_receiver(msg)
local hash = 'typing:'..receiver
     if matches[1] == 'typing' and is_sudo(msg) then
--Enable Typing
     if matches[2] == '!ontyp' then
    redis:del(hash)
   return '???? ???? ???? ??'
--Disable Typing
     elseif matches[2] == '!offtyp' then
    redis:set(hash, true)
   return '???? ???? ?????  ??'
--Typing Status
      elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'Typing is enable'
       else
   return 'Typing is disable'
         end
      end
   end
      if not redis:get(hash) then
send_typing(get_receiver(msg), ok_cb, false)
   end
end
return { 
patterns = {
"^[!/#](typing) (.*)$",
"(.*)",
},
run = solid
}
