--[[
▇▇▇▇ @sajad14p ▇▇▇            ▇▇▇▇▇▇▇
▇           ▇           ▇            ▇                    ▇
▇           ▇           ▇            ▇                    ▇
▇           ▇           ▇            ▇                    ▇
▇▇▇▇              ▇            ▇        تم تطوير وبرمجه من قبل ابو جود            ▇
▇           ▇           ▇            ▇                    ▇
▇           ▇           ▇            ▇ ¦ @cgngv  ▇
▇           ▇           ▇            ▇                    ▇ ¦Dev :@sajad14p
▇▇▇▇ @sajad14p ▇▇▇   
#-------------------------------------------------------------------
]]
function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
	-- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

function ZainJoinChannel(msg)
if redis:get(brothers..'4DaySleep') then
local url , res = https.request("https://api.telegram.org/bot"..token.."/getchatmember?chat_id=@cgngv&user_id="..msg.sender_user_id_);
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
bd = '🙋🏻‍♂| العضو ['..USERNAME..'](tg://user?id='..msg.sender_user_id_..') \n📡| لأستخدام البوت عليك الاشتراك ب قناة السورس @GLOBLA'
sendMsg(msg.chat_id_,msg.id_,bd)
end,nil)
return false
else
return true
end
else
return true
end
end


function lock_photos(msg)
if not msg.Director then 
return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط"
end
redis:set(brothers.."getidstatus"..msg.chat_id_, "Simple")
return  "📮*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📌*¦*الايدي بالصوره  تم تعطيله  ☑️" 
end 
function unlock_photos(msg)
if not msg.Director then
return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط"
end
redis:set(brothers.."getidstatus"..msg.chat_id_, "Photo")
return  "📮*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📌*¦*الايدي بالصوره  تم تفعيله ☑️" 
end
function cmds_on(msg)
if not msg.Creator then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط"
end
redis:set(brothers..'lock:babak:'..msg.chat_id_,'on')
return "📮*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📌¦تم تعطيل الرفع في المجموعه ☑️"
end
function cmds_off(msg)
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط"
end
redis:set(brothers..'lock:babak:'..msg.chat_id_,'off')
return "📮*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📌¦ تم تفعيل الرفع في المجموعه ☑️"
end

function lockjoin(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط"
end
redis:set(brothers..'lock:join:'..msg.chat_id_,true)
return "*📮*¦* أهلا عزيزي *"..msg.TheRankCmd.."*\n📌¦ تم قفل الاضافه ☑️*" 

end
function unlockjoin(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط"
end
redis:del(brothers..'lock:join:'..msg.chat_id_)
return "*📮*¦* أهلا عزيزي *"..msg.TheRankCmd.."*\n📌¦ تم فتح الاضافه ☑️*" 
end


local function ibrothers(msg,MsgText)
if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
redis:set(brothers.."getidstatus"..msg.chat_id_, "Photo")
redis:set(brothers..'lock:babak:'..msg.chat_id_,'off')
return modadd(msg)  
end
if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end
if MsgText[1] == "تفعيل الايدي بالصوره" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "تعطيل الايدي بالصوره" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "تعطيل الرفع" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "تفعيل الرفع" and not MsgText[2] then
return cmds_off(msg) 
end

if MsgText[1] == "قفل الدخول" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "فتح الدخول" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(brothers..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(brothers..'CheckExpire::'..msg.chat_id_) then 
redis:set(brothers..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┇تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️┇تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️┇في مجموعه  » »  '..redis:get(brothers..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┇عزيزي المطور ✋🏿\n👨🏻‍🔧┇شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if MsgText[2] == '1' then
redis:setex(brothers..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(brothers..'CheckExpire::'..msg.chat_id_) then 
redis:set(brothers..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┇تم تفعيل الاشتراك   👍🏿\n📆┇ الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️┇تم تفعيل الاشتراك  👍🏿\n📆┇ الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(brothers..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(brothers..'CheckExpire::'..msg.chat_id_) then 
redis:set(brothers..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┇تم تفعيل الاشتراك   👍🏿\n📆┇ الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️┇تم تفعيل الاشتراك   👍🏿\n📆┇ الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(brothers..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(brothers..'CheckExpire::'..msg.chat_id_) then 
redis:set(brothers..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️┇تم تفعيل الاشتراك   👍🏿\n📆┇ الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️┇تم تفعيل الاشتراك   👍🏿\n📆┇ الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
local check_time = redis:ttl(brothers..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳┇`باقي من الاشتراك ` » » * \n 📆┇ '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳┇`باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳┇`باقي من الاشتراك ` » » * \n 📆┇ '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳┇`باقي من الاشتراك ` » » * \n 📆┇ '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳┇`باقي من الاشتراك ` » » * \n 📆┇ '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳┇`باقي من الاشتراك ` » » * \n 📆┇ '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end


if MsgText[1] == "المجموعه" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(brothers..'group:name'..msg.chat_id_) or '')
redis:set(brothers..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"👨🏻‍🎤┇ ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*👥┇* عدد الاعـضـاء ⇜ ❪ *"..data.member_count_.."* ❫"
.."\n*⏺️┇* عدد المحظـوريـن ⇜ ❪ *"..data.kicked_count_.."* ❫"
.."\n*👨🏻‍🔧┇* عدد الادمـنـيـه ⇜ ❪ *"..data.administrator_count_.."* ❫"
.."\n*📌┇* ايدي المجموعه ⇜ ❪`"..msg.chat_id_.."`❫"
.."\n\n📮┇الاسم ⇜ ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return GetListAdmin(msg) 
end

if MsgText[1] == "تاك للكل" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "المنشئين" then 
if not msg.HASSNBOT then return "👨🏻‍💻*┇* {لـلـمـنشـى الاسـاسـي} فـقـط" end
return ownerlist(msg)
end

if MsgText[1] == "المدراء" then 
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
return MODER(msg)
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return whitelist(msg) 
end

if MsgText[1] == "صلاحياته" then 
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "صلاحياته" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'📮┇المعرف غير صحيح \n👨🏻‍✈️')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'📮┇هاذا معرف قناة \n👨🏻‍✈️')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "فحص البوت" then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. brothers..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
return sendMsg(msg.chat_id_,msg.id_,'\n📌┇اهلا عزيزي البوت هنا ادمن بالكروب \n💢┇وصلاحياته هي ⇓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n🔃┇تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n💌┇حذف الرسائل ↞ ❪ '..delete..' ❫\n🎥┇حظر المستخدمين ↞ ❪ '..restrict..' ❫\n♻┇دعوة مستخدمين ↞ ❪ '..invite..' ❫\n⚒┇تثبيت الرسائل ↞ ❪ '..pin..' ❫\n⌨┇اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n💠┇ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(brothers..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(brothers..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"📮*┇*أهلا عزيزي "..msg.TheRankCmd.." \n📌*┇* تم تثبيت الرساله ☑️")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📮*┇* عذرا لا يمكنني التثبيت .\n📌*┇* لست مشرف او لا املك صلاحيه التثبيت ☑️')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not msg.Director and redis:get(brothers..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"📮*┇*أهلا عزيزي "..msg.TheRankCmd.."  \n📌*┇* تم الغاء تثبيت الرساله ☑️")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📮*┇* عذرا لا يمكنني الغاء التثبيت .\n📌*┇* لست مشرف او لا املك صلاحيه التثبيت ☑️')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'📮*┇* عذرا عزيزي '..msg.TheRankCmd..' .\n📌*┇* لا توجد رساله مثبته لاقوم بازالتها ☑️')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "الغاء تقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "اضف مميز" then
if not msg.Admin then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"📮*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📌*¦* الرفع معطل ☑️")
end
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "اضف المدير"  or MsgText[1] == "اضف مدير" ) then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"📮*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📌*¦* الرفع معطل ☑️")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "اضف منشى اساسي" or MsgText[1] == "اضف منشئ اساسي") then
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى اساسي" or MsgText[1] == "تنزيل منشئ اساسي" ) then
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if (MsgText[1] == "اضف منشى" or MsgText[1] == "اضف منشئ") then
if not msg.HASSNBOT then return "👨🏻‍💻*¦* {المنشئ الاساسي,المطور} فقط" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="hassan"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="hassan"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="hassan"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.HASSNBOT then return "👨🏻‍💻*¦* {المنشئ الاساسي,المطور} فقط" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="hassann"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="hassann"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="hassann"})
end 
return false
end


if MsgText[1] == "اضف ادمن" then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(brothers..'lock:babak:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"📮*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📌*¦* الرفع معطل ☑️")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end

if MsgText[1] == "تنزيل الكل" then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end

local Admins = redis:scard(brothers..'admins:'..msg.chat_id_)
redis:del(brothers..'admins:'..msg.chat_id_)
local NumMDER = redis:scard(brothers..'owners:'..msg.chat_id_)
redis:del(brothers..'owners:'..msg.chat_id_)
local MMEZEN = redis:scard(brothers..'whitelist:'..msg.chat_id_)
redis:del(brothers..'whitelist:'..msg.chat_id_)

return "📮┇أهلا عزيزي "..msg.TheRankCmd.." ⇓\n👨🏻‍🔧┇تــــم تنزيل ❴ "..Admins.." ❵ من الادمنيه\n👮🏻‍♂️┇تــــم تنزيل ❴ "..NumMDER.." ❵ من المدراء\n👨🏻‍🎤┇تــــم تنزيل ❴ "..MMEZEN.." ❵ من المميزين\n\n💠┇تــــم تـنـزيـل الـكـل بـنـجـاح ☑️" 
end


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقيد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقيد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقيد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقيد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقيد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاك" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "الميديا" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقيد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقيد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقيد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقيد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاك" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "الميديا" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(brothers..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(brothers..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"📮*┇*تم انشاء رابط جديد \n📌┇["..LinkGp.."]\n🔖┇لعرض الرابط ارسل { الرابط } ☑️")
else
return sendMsg(msg.chat_id_,msg.id_,"📮┇لا يمكنني انشاء رابط للمجموعه ./n📌┇لانني لست مشرف في المجموعه ☑️")
end
else
return sendMsg(msg.chat_id_,msg.id_,"📮┇لقد قمت بانشاء الرابط سابقا .\n📌┇ارسل { الرابط } لرؤيه الرابط  ☑️")
end
return false
end 

if MsgText[1] == "رابط" then
if not redis:get(brothers..'linkGroup'..msg.chat_id_) then 
return "📮*┇* اوه 📌 لا يوجد رابط ☹️\n🔖*┇*لانشاء رابط ارسل { انشاء رابط } ☑️" 
end
local GroupName = redis:get(brothers..'group:name'..msg.chat_id_)
local GroupLink = redis:get(brothers..'linkGroup'..msg.chat_id_)
return "💳┇رابـط الـمـجـمـوعه 📊\n📌┇"..Flter_Markdown(GroupName).." :\n\n["..GroupLink.."]\n"
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
local GroupLink = redis:get(brothers..'linkGroup'..msg.chat_id_)
if not GroupLink then return "📡*┇* اوه 🙀 لا يوجد هنا رابط\n🔖┇*رجائا اكتب [ضع رابط]*🔃" end
local Text = "💳┇رابـط الـمـجـمـوعه 📊\n📌┇"..Flter_Markdown(redis:get(brothers..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "📮*┇*عذرا عزيزي \n📌┇لم استطيع ارسالك الرابط لانك قمت بحظر البوت ☑️"
elseif res == 400 then
return "📮*┇*عذرا عزيزي \n📌┇ لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا ☑️"
end
if res == 200 then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."  \n📌┇تم ارسال الرابط خاص لك ☑️"
end
end


if MsgText[1] == "ضع رابط" then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
redis:setex(brothers..'rulse:wittingg'..msg.sender_user_id_,300,true)
return '📮┇حسننا عزيزي  📌\n🗯┇الان ارسل رابط  للمجموعه ☑️'
end

if MsgText[1] == "الرابط" then
if not redis:get(brothers..'rulse:msgg'..msg.chat_id_) then 
return "📮*┇* اوه 📌 لا يوجد رابط ☹️\n🔖*┇*لانشاء رابط ارسل { ضع رابط او انشاء رابط } ☑️" 
else 
return "*🔖┇رابط المجموعة 💯 :*\n"..redis:get(brothers..'rulse:msgg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
redis:setex(brothers..'rulse:witting'..msg.sender_user_id_,300,true)
return '📮┇حسننا عزيزي  ✋🏿\n📌┇الان ارسل القوانين  للمجموعه ☑️'
end

if MsgText[1] == "القوانين" then
if not redis:get(brothers..'rulse:msg'..msg.chat_id_) then 
return "📮*┇*مرحبأ عزيري القوانين كلاتي 👇🏻\n📌┇ممنوع نشر الروابط \n👨🏻‍💻┇ممنوع التكلم او نشر صور اباحيه \n⚔┇ممنوع  اعاده توجيه\n💭┇ممنوع التكلم بلطائفه \n♥️┇الرجاء احترام المدراء والادمنيه 🙇🏻‍♂️"
else 
return "*🔖┇القوانين :*\n"..redis:get(brothers..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "☑┇ حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(brothers..'flood'..msg.chat_id_,MsgText[2]) 
return "☑┇ تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if 500 < tonumber(MsgText[2]) then return "📮*┇* حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⏺️┇* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  ☑️")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⏺️┇* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  ☑️")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end

local Admins = redis:scard(brothers..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "📮*┇* اوه 📌 هنالك خطأ 🚸\n🏌🏻‍♂️┇عذرا لا يوجد ادمنيه ليتم مسحهم ☑️" 
end
redis:del(brothers..'admins:'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇تم مسح {"..Admins.."} من الادمنيه في البوت ☑️"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local Mn3Word = redis:scard(brothers..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "📮*┇* عذرا لا توجد كلمات ممنوعه ليتم حذفها ☑️" 
end
redis:del(brothers..':Filter_Word:'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇تم مسح {*"..Mn3Word.."*} كلمات من المنع ☑️"
end


if MsgText[2] == "الرابط" then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'rulse:msgg'..msg.chat_id_) then 
return "📮┇عذرا لا يوجد رابط ليتم مسحه ☑️" 
end
redis:del(brothers..'rulse:msgg'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n☑️┇تم حذف الرابط المضاف بنجاح ☑️"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'rulse:msg'..msg.chat_id_) then 
return "📮┇عذرا لا يوجد قوانين ليتم مسحه ☑️" 
end
redis:del(brothers..'rulse:msg'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇تم حذف القوانين بنجاح ☑️"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'welcome:msg'..msg.chat_id_) then 
return "📮*┇* اوه 📌 هنالك خطأ 🚸\n⏺️┇عذرا لا يوجد ترحيب ليتم مسحه ☑️" 
end
redis:del(brothers..'welcome:msg'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇تم حذف الترحيب بنجاح ☑️"
end


if MsgText[2] == "المنشى الاساسي" then
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
local NumMnsha = redis:scard(brothers..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "📮┇عذرا لا يوجد منشى اساسي ☑️" 
end
redis:del(brothers..':Hussain:'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇ تم مسح {* "..NumMnsha.." *} المنشى الاساسي ☑️"
end


if MsgText[2] == "المنشئين" then
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
local NumMnsha = redis:scard(brothers..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "📮┇عذرا لا يوجد منشئيين ليتم مسحهم ☑️" 
end
redis:del(brothers..':MONSHA_BOT:'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇ تم مسح {* "..NumMnsha.." *} من المنشئين ☑️"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local NumMDER = redis:scard(brothers..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "📮┇عذرا لا يوجد مدراء ليتم مسحهم ☑️" 
end
redis:del(brothers..'owners:'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇ تم مسح {* "..NumMDER.." *} من المدراء  ☑️"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end

local list = redis:smembers(brothers..'banned:'..msg.chat_id_)
if #list == 0 then return "*📌┇لا يوجد مستخدمين محظورين  *" end
message = '📮*┇* قائمه الاعضاء المحظورين ☑️'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(brothers..'banned:'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇ تم مسح {* "..#list.." *} من المحظورين  ☑️"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local MKTOMEN = redis:scard(brothers..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "📮*┇* لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(brothers..'is_silent_users:'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇ تم مسح {* "..MKTOMEN.." *} من المكتومين  ☑️"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local MMEZEN = redis:scard(brothers..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*📮*┇لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(brothers..'whitelist:'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇ تم مسح {* "..MMEZEN.." *} من المميزين  ☑️"
end

if MsgText[2] == 'رابط' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'linkGroup'..msg.chat_id_) then 
return "*📌*┇لا يوجد رابط مضاف اصلا " 
end
redis:del(brothers..'linkGroup'..msg.chat_id_)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."   \n📌┇تم مسح رابط المجموعه ☑️"
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
redis:setex(brothers..'name:witting'..msg.sender_user_id_,300,true)
return "📮┇حسننا عزيزي  ✋🏿\n📌┇الان ارسل الاسم  للمجموعه ☑️"
end


if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'📮┇تم مسح الصوره آلمـجمـوعهہ  ☑️')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'📮┇تم تغيير صوره آلمـجمـوعهہ ⠀☑️')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'📮┇ليس لدي صلاحيه تغيير الصوره \n📌 ┇يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀☑️')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(brothers..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '📮┇حسننا عزيزي\n📌┇الان قم بارسال الصوره ☑️' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
redis:setex(brothers..'about:witting'..msg.sender_user_id_,300,true) 
return "📮┇حسننا عزيزي\n📌┇الان ارسل الوصف  للمجموعه ☑️" 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"🔖| لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "🤖| عـدد الـبـوتات •⊱ {* "..(Total - 1).." *} ⊰•\n\n"
if NumBot == 0 then 
TextR = TextR.."👮🏻‍♂️| لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."📌| لم يتم طـرد {* "..NumBotAdmin.." *} بوت لآنهہ‌‏م مـشـرفين."
else
TextR = TextR.."☑| تم طـرد كــل البوتآت بنجآح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '🤖| قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

📮| لـديـک {]]..total..[[} بـوتـآت
🔖| ملاحظة : الـ ★ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
sendMsg(msg.chat_id_,msg.id_,'📮| جاري البحث عـن الـحـسـابـات المـحذوفـة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(brothers..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(brothers..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(brothers..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(brothers..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"📮┇تم طـرد {* "..NumMemDone.." *} من آلحسـآبآت آلمـحذوفهہ‏‏ ☑️")
else
sendMsg(msg.chat_id_,msg.id_,'📮┇لا يوجد حسابات محذوفه في المجموعه ☑️')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then

if not MsgText[2] and not msg.reply_id then
if redis:get(brothers..'lock_id'..msg.chat_id_) then
local msgs = redis:get(brothers..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
local points = redis:get(brothers..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(brothers..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(brothers..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if redis:get(brothers.."getidstatus"..msg.chat_id_) == "Photo" then
	if data.photos_[0] then 
		ali = {'حلك ببكن 🙈🌝','فدوه الله💫❤','عمي والله مااصايره🙁😹','ما مرتاحلك🌝','منور ئلكمر 🌝✨','شدتحس؟  🤕','حفظك ابو هاشم🌚😹','يحفضك ئلسيد 🌝','شنـهاي جنك كيكا 🤤??','دلهـا لتكفرني 😑💔'} 
		ssssys = ali[math.random(#ali)]
		if not redis:get("KLISH:ID") then
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,''..ssssys..'\n📌╣ايديـك ~⪼ '..msg.sender_user_id_..' \n📮╣معرفـك ~⪼ '..UserNameID..' \n👮🏻‍♂️╣رتبتـك ~⪼ '..msg.TheRank..' \n🏅╣تفاعلك ~⪼ '..Get_Ttl(msgs)..' \n✉️╣رسائلك ~⪼ '..msgs..' \n🏷╣سحكاتـك ~⪼ '..rfih..'\n🏆╣مجوهراتك ~⪼ '..nko..' \n',dl_cb,nil)
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,""..ssssys.."\n"..Text.."",dl_cb,nil)
		end
	else
		if not redis:get("KLISH:ID") then
		sendMsg(msg.chat_id_,msg.id_,'📮╣معرفـك ~⪼ '..UserNameID..'\n📌╣ايديـك ~⪼ '..msg.sender_user_id_..' \n👮🏻‍♂️╣رتبتـك ~⪼ '..msg.TheRank..' \n🏅╣تفاعلك ~⪼ '..Get_Ttl(msgs)..' \n✉️╣رسائلك ~⪼ '..msgs..' \n🏷╣سحكاتـك ~⪼ '..rfih..'  \n🏆┇مجوهراتك ~⪼ '..nko..' \n')
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		end
	end
else
	if redis:get("KLISH:ID") then
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		else
		sendMsg(msg.chat_id_,msg.id_,'📮╣معرفـك ~⪼ '..UserNameID..'\n📌╣ايديـك ~⪼ '..msg.sender_user_id_..' \n👮🏻‍♂️╣رتبتـك ~⪼ '..msg.TheRank..' \n🏅╣تفاعلك ~⪼ '..Get_Ttl(msgs)..' \n✉️╣رسائلك ~⪼ '..msgs..' \n🏷╣سحكاتـك ~⪼ '..rfih..' \n🏆╣مجوهراتك ~⪼ '..nko..' \n')
		end
end

end) 
end ,nil)
end
return false
end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(brothers..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(brothers..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(brothers..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(brothers..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(brothers..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(brothers..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(brothers..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(brothers..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(brothers..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n✔️┇❪ الاحـصـائـيـات الـرسـائـلك ❫\n \n"
.."💌┇الـرسـائـل ❪ `"..msgs.."` ❫\n"
.."☎┇الـجـهـات ❪ `"..NumGha.."` ❫\n"
.."🖼┇الـصـور ❪ `"..photo.."` ❫\n"
.."📤┇الـمـتـحـركـه ❪ `"..animation.."` ❫\n"
.."📈┇الـمـلـصـقات ❪ `"..sticker.."` ❫\n"
.."🔗┇الـبـصـمـات ❪ `"..voice.."` ❫\n"
.."🖲┇الـصـوت ❪ `"..audio.."` ❫\n"
.."🎞┇الـفـيـديـو ❪ `"..video.."` ❫\n"
.."📬┇الـمـيـديـا ❪ `"..edited.."` ❫\n\n"
.."📊┇تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(brothers..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "⚠️*┇*عذرا لا يوجد رسائل لك في البوت  ✖️" end
redis:del(brothers..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "📮*┇*تم مسح {* "..msgs.." *} من رسائلك ☑️"
end

if MsgText[1]== 'جهاتي' then
return '☎️*┇*  عدد جهہآتگ آلمـضـآفهہ‏‏ ⇜ ❪ '..(redis:get(brothers..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n🐾'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(brothers..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "⚠️*┇*عذرا ليس لديك جهات لكي يتم مسحها" end
redis:del(brothers..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "📮*┇*تم مسح {* "..adduser.." *} من جهاتك ☑️"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..'\n\n⚁┇اسمك الثاني ⇜ '..(data.last_name_ or ""),90)
local Get_info = "⚀┇اسمك الاول ⇜ \n "..FlterName.." \n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'مجوهراتي'  then
local points = redis:get(brothers..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if nko == 0 then  return "⚠️*┇*عذرا ليس لديك مجوهرات لكي يتم مسحها" end
redis:del(brothers..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "📮*┇*تم مسح {* "..points.." *} من مجوهراتك ☑️"
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(brothers..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(brothers..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(brothers..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(brothers..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(brothers..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(brothers..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(brothers..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(brothers..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(brothers..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="👨🏽‍🔧┇اهـلا بـك عزيزي في معلوماتك 🥀 \n"
.."ـ.——————————\n"
.."🗯┇الاســم ❪ "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." ❫\n"
.."💠┇المعرف ❪ "..ResolveUser(data).." ❫\n"
.."⚜️┇الايـدي ❪ `"..msg.sender_user_id_.."` ❫\n"
.."🚸┇رتبتــك ❪ "..msg.TheRank.." ❫\n"
.."🔰┇ـ ❪ `"..msg.chat_id_.."` ❫\n"
.."ـ.——————————\n"
.." ❪ الاحـصـائـيـات الـرسـائـل ❫\n"
.."💬┇الـرسـائـل ❪ `"..msgs.."` ❫\n"
.."📞┇الـجـهـات ❪ `"..NumGha.."` ❫\n"
.."📸┇الـصـور ❪ `"..photo.."` ❫\n"
.."📽┇الـمـتـحـركـه ❪ `"..animation.."` ❫\n"
.."🔖┇الـمـلـصـقات ❪ `"..sticker.."` ❫\n"
.."🎙┇الـبـصـمـات ❪ `"..voice.."` ❫\n"
.."🔊┇الـصـوت ❪ `"..audio.."` ❫\n"
.."🎞┇الـفـيـديـو ❪ `"..video.."` ❫\n"
.."📬┇الـمـيـديـا ❪`"..edited.."` ❫\n\n"
.."📊┇تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "مسح معلوماتي" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(brothers..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(brothers..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(brothers..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(brothers..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(brothers..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(brothers..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(brothers..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(brothers..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(brothers..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="🙋🏻‍♂┇اهلن عزيزي تم حذف جميع معلوماتك "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
redis:set(brothers..'welcom:witting'..msg.sender_user_id_,true) 
return "📮┇حسننا عزيزي \n📌┇ارسل كليشه الترحيب الان\n\n👮🏻‍♂️┇ملاحظه تستطيع اضافه دوال للترحيب مثلا :\n🏌🏻‍♂️┇اضهار قوانين المجموعه  » *{القوانين}*  \n⏺️┇ اضهار الاسم العضو » *{الاسم}*\n👨🏻‍✈️┇اضهار المعرف العضو » *{المعرف}*\n🙋🏻‍♂️┇اضهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(brothers..'welcome:msg'..msg.chat_id_))
else 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."  \n📌*┇*كمر دخل للكروب رحبوو ءخوان 😐💗 " 
end 
end


if MsgText[1] == "ايدي العضو"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end


if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "👨🏻‍💻*¦* {المنشئ,المطور} فقط" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
local mtwren = redis:scard(brothers..':SUDO_BOT:')
if mtwren == 0 then  return "👨🏻‍💻*┇* عذرا لا يوجد مطورين في البوت  ☑️" end
redis:del(brothers..':SUDO_BOT:') 
return "👨🏻‍💻*┇* تم مسح {* "..mtwren.." *} من المطورين ☑️"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
local addbannds = redis:scard(brothers..'gban_users')
if addbannds ==0 then 
return "*🙋🏻‍♂️┇قائمة الحظر فارغه .*" 
end
redis:del(brothers..'gban_users') 
return "📮*┇* تـم مـسـح { *"..addbannds.." *} من قائمه العام  ☑️" 
end 

if msg.SudoBase then

if MsgText[1] == "اضف مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "تنظيف المجموعات 📊" then
local groups = redis:smembers(brothers..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'🔗*┇* جـيـد , لا توجد مجموعات وهميه \n✓')
else
sendMsg(msg.chat_id_,msg.id_,'🔍*┇* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n🚸*┇* تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n📉*┇* اصبح العدد الحقيقي الان •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين 📤" or MsgText[1] == "تنظيف المشتركين 📤" then
local pv = redis:smembers(brothers..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(brothers..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'⚜| جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'📑*┇* عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n🚸*┇* تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n📉*┇* اصبح العدد الحقيقي الان •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🏞️" then
redis:setex(brothers..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'📮┇حسننا عزيزي\n📌┇الان قم بارسال الصوره للترحيب  ☑️' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then 
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(brothers..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[⚜┊اهلا انآ بوت آسـمـي ]]..redis:get(brothers..':NameBot:')..[[ ✓
📮┊آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
📌┊مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...
🛰️┊[اضغط هنا دخول لقتاة سورس ](t.me/cgngv) •
👨🏻‍💻┊مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
]])

return false
else
return "📮| لا توجد صوره مضافه للترحيب في البوت \n📌| لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(brothers..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '📮┇حسننا عزيزي\n📌┇الان قم بارسال الكليشه ☑️' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(brothers..':addnumberusers',MsgText[2]) 
return '📮*┇* تم وضـع شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..MsgText[2]..'】* عضـو  📌\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'📮*┇* شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..redis:get(brothers..':addnumberusers')..'】* عضـو  📌\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات ⌛" then
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
return '📮*┇* عدد المجموعات المفعلة » `'..redis:scard(brothers..'group:ids')..'`  ➼' 
end

if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين 📌" then
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
return '⏺️*┊*عدد المشتركين في البوت : `'..redis:scard(brothers..'users')..'` \n📡'
end

if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if redis:sismember(brothers..'group:ids',MsgText[2]) then
local name_gp = redis:get(brothers..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'📮*┇* تم تعطيل المجموعه بأمر من المطور  \n📌*┇* سوف اغادر جاوو 🚶🏻🚶🏻 ...\n✘')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '📮*┇* تم تعطيل المجموعه ومغادرتها \n☑️*┇* المجموعةة » ['..name_gp..']\n📌*┇* الايدي » ( *'..MsgText[2]..'* )\n✓'
else 
return '📮*┇* لا توجد مجموعه مفعله بهذا الايدي !\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(brothers..":TEXT_SUDO") or '📮┇لا توجد كليشه المطور .\n📌┇يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " ☑️'
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📻" then
if not msg.SudoUser then return"👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if not msg.SudoBase and not redis:get(brothers..'lock_brod') then 
return "📮*┇* الاذاعه مقفوله من قبل المطور الاساسي  " 
end
redis:setex(brothers..'fwd:'..msg.sender_user_id_,300, true) 
return "📮┇حسننا الان ارسل التوجيه للاذاعه ☑️" 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام 📢" then		
if not msg.SudoUser then return"👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if not msg.SudoBase and not redis:get(brothers..'lock_brod') then 
return "📮*┇* الاذاعه مقفوله من قبل المطور الاساسي  " 
end
redis:setex(brothers..'fwd:all'..msg.sender_user_id_,300, true) 
return "📮┇حسننا الان ارسل الكليشه للاذاعه عام ☑️" 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص 🗃️" then		
if not msg.SudoUser then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if not msg.SudoBase and not redis:get(brothers..'lock_brod') then 
return "📮*┇* الاذاعه مقفوله من قبل المطور الاساسي  " 
end
redis:setex(brothers..'fwd:pv'..msg.sender_user_id_,300, true) 
return "📮┇حسننا الان ارسل الكليشه للاذاعه خاص ☑️"
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه 📣" then		
if not msg.SudoUser then return"👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if not msg.SudoBase and not redis:get(brothers..'lock_brod') then 
return "📮*┇* الاذاعه مقفوله من قبل المطور الاساسي  " 
end
redis:setex(brothers..'fwd:groups'..msg.sender_user_id_,300, true) 
return "📮┇حسننا الان ارسل الكليشه للاذاعه للمجموعات ☑️" 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين 👷" then
if not msg.SudoUser then return"👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
return sudolist(msg) 
end
 
if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمه العام 🚫" then 
if not msg.SudoUser then return"👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return '🏷*┇* رتبتك ⇜ ❪ '..msg.TheRank..' ❫\n➖' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
redis:del(brothers..'welcom:witting'..msg.sender_user_id_,
brothers..'rulse:witting'..msg.sender_user_id_,
brothers..'rulse:witting'..msg.sender_user_id_,
brothers..'name:witting'..msg.sender_user_id_,
brothers..'about:witting'..msg.sender_user_id_,
brothers..'fwd:all'..msg.sender_user_id_,
brothers..'fwd:pv'..msg.sender_user_id_,
brothers..'fwd:groups'..msg.sender_user_id_,
brothers..'namebot:witting'..msg.sender_user_id_,
brothers..'addrd_all:'..msg.sender_user_id_,
brothers..'delrd:'..msg.sender_user_id_,
brothers..'addrd:'..msg.sender_user_id_,
brothers..'delrdall:'..msg.sender_user_id_,
brothers..'text_sudo:witting'..msg.sender_user_id_,
brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_,
brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return '📮*┇* تم آلغآء آلآمـر بنجآح ☑️'
end  


if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return '🛡┊ اصدار سورس الاخـويـن : *v'..version..'* \n📡'
end

if (MsgText[1] == 'تحديث السورس' or MsgText[1] == 'تحديث السورس ™') then
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
local GetVerison = https.request('https://github.com/BrothersTeam/brothers.github.io/GetVersion.txt') or 0
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'🔛*┊* يوجد تحديث جديد الان \n📡*┊* جاري تنزيل وتثبيت التحديث  ...')
redis:set(brothers..":VERSION",GetVerison)
return false
else
return "🔖| الاصدار الحالي : *v"..version.."* \n👨🏾‍🔧*┊* لديـك احدث اصدار \n📦"
end
return false
end

if MsgText[1] == 'جلب الكروبات' then
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع الكروبات' then
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'⏳*┇* جاري رفع النسخه انتظر قليلا ... \n⌛️')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"📛*┇* عذرا النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n💥")
end
else 
sendMsg(msg.chat_id_,msg.id_,'📛*┇* عذرا اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس الزعيم يرجى جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n💥')
end  
else
sendMsg(msg.chat_id_,msg.id_,'📛*┇* عذرا الملف ليس بصيغه Json !?\n💥')
end 
else
sendMsg(msg.chat_id_,msg.id_,'📛*┇* عذرا هذا ليس ملف النسحه الاحتياطيه للمجموعات\n💥')
end 
end,nil)
else 
return "📦*┇* ارسل ملف النسخه الاحتياطيه اولا\n📑*┇* ثم قم بالرد على الملف وارسل \" `رفع الكروبات ` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
return "يـب شغال تاجراسي🌝🤟🏻" 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايديي📌") and msg.type == "pv" then return  "\n👨🏻‍💻┊اهلن عزيزي المطور ايديك هوه ⏬\n\n🧟‍♂┊"..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس 📡" and msg.type == "pv" then
local inline = {{{text="⚜┇قنآهہ‏‏ آلسـورس ضـغـط هـنـآ ",url="t.me/cgngv"}}}
send_key(msg.sender_user_id_,'  [⚜┇قناة سورس : الاخوين](t.me/cgngv)',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات 📊" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
return '📑┊الاحصائيات 📮 \n\n📤*┊*عدد الكروبات المفعله : '..redis:scard(brothers..'group:ids')..'\n📈*┊*عدد المشتركين في البوت : '..redis:scard(brothers..'users')..'\n📡'
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام 📯" then
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
redis:setex(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(brothers..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "📮┇حسننا الان ارسل كلمة الرد العام ☑️"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local names 	= redis:exists(brothers..'replay:'..msg.chat_id_)
local photo 	= redis:exists(brothers..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(brothers..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(brothers..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(brothers..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(brothers..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(brothers..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(brothers..'replay:'..msg.chat_id_,brothers..'replay_photo:group:'..msg.chat_id_,brothers..'replay_voice:group:'..msg.chat_id_,
brothers..'replay_animation:group:'..msg.chat_id_,brothers..'replay_audio:group:'..msg.chat_id_,brothers..'replay_sticker:group:'..msg.chat_id_,brothers..'replay_video:group:'..msg.chat_id_)
return "📌 تم مسح كل الردود ☑️"
else
return '📌*┇* لا يوجد ردود ليتم مسحها ☑️'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return"♨️ للمطورين فقط ! 💯" end
local names 	= redis:exists(brothers..'replay:all')
local photo 	= redis:exists(brothers..'replay_photo:group:')
local voice 	= redis:exists(brothers..'replay_voice:group:')
local imation 	= redis:exists(brothers..'replay_animation:group:')
local audio 	= redis:exists(brothers..'replay_audio:group:')
local sticker 	= redis:exists(brothers..'replay_sticker:group:')
local video 	= redis:exists(brothers..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(brothers..'replay:all',brothers..'replay_photo:group:',brothers..'replay_voice:group:',brothers..'replay_animation:group:',brothers..'replay_audio:group:',brothers..'replay_sticker:group:',brothers..'replay_video:group:')
return "📮 تم مسح كل الردود العامه📌"
else
return "📮لا يوجد ردود عامه ليتم مسحها 📌"
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
redis:set(brothers..'delrdall:'..msg.sender_user_id_,true) 
return "📮┊حسننا عزيزي \n📌┊الان ارسل الرد لمسحها من  المجموعات ☑️"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
redis:set(brothers..'delrd:'..msg.sender_user_id_,true)
return "📮┊حسننا عزيزي \n📌┊الان ارسل الرد لمسحها من  للمجموعه ☑️"
end

if MsgText[1]== 'الردود' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local names  	= redis:hkeys(brothers..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(brothers..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(brothers..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(brothers..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(brothers..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(brothers..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(brothers..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '📮*┊*لا يوجد ردود مضافه حاليا 📌' 
end
local ii = 1
local message = '📮*┊*ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره 🏞 ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص 🗯 ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه 🎙 ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه 🔊 ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه 📮' then
if not msg.SudoBase then return "♨️ للمطور فقط ! 💯" end
local names 	= redis:hkeys(brothers..'replay:all')
local photo 	= redis:hkeys(brothers..'replay_photo:group:')
local voice 	= redis:hkeys(brothers..'replay_voice:group:')
local imation 	= redis:hkeys(brothers..'replay_animation:group:')
local audio 	= redis:hkeys(brothers..'replay_audio:group:')
local sticker 	= redis:hkeys(brothers..'replay_sticker:group:')
local video 	= redis:hkeys(brothers..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '📮*┊*لا يوجد ردود مضافه حاليا 📌' 
end
local ii = 1
local message = '📮*┊*الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره 🏞 ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص 🗯 ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه 🎙 ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه 🎭 ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  🎞 ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
redis:setex(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(brothers..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "☑️┊حسننا , الان ارسل كلمه الرد \n-"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
if not msg.SudoBase then return"👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
redis:setex(brothers..'namebot:witting'..msg.sender_user_id_,300,true)
return"📮┊حسننا عزيزي \n📌┇الان ارسل الاسم  للبوت ☑️"
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 ❪ Seystem ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖 ❪ Memory ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾 ❪ HardDisk ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️ ❪ Processor ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*📡 ❪ Location ❫\n*»» ]]..DataCenter..[[*'
echo '*------------------------------\n*👨🏾‍🔧 ❪ Server[_]Login ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌 ❪ Uptime ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟l ❪ نظام التشغيل ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖l ❪ الذاكره العشوائيه ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾l ❪ وحـده الـتـخـزيـن ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️l ❪ الـمــعــالــج ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*📡l ❪ موقـع الـسـيـرفـر ❫\n*»» ]]..DataCenter..[[*'
echo '*------------------------------\n*👨🏾‍🔧l ❪ الــدخــول ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌l ❪ مـده تـشغيـل الـسـيـرفـر ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "الاوامر" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
return [[
‏‎‏❋┇مـسـآرت آلآوآمـر آلعآمـهہ‏‏ ⇊

👮🏻‍♂️┇*م1* » *اومـر* *الاداره*
⏺️┇*م2* » *اوامـر* *اعدادات* *المـجمـوعه*
🔐┇*م3* » *اوامـر* *الحمـايه*
🤺┇*م4* » *اوامر* *الخدمه*
👨🏻‍💻┇*م5* »  *اوامـر* *المـطـور*
📌┇*م6* » *لاضـافه* *رد* *مـعين*
😹┇*م7* » *اوامـر* *التحشيش*

 ‏‎‏👨🏻‍💻┇رآسـلني للآسـتفسـآر ☜ { ]]..SUDO_USER..[[ } ✓ ]]
end
if MsgText[1]== 'م1' then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
local text =[[
1⇜ اوامر الرفع والتنزيل ⬇️


👨🏻‍✈️┇*اضف* *منشئ* ↭ *تنزيل* *منشئ*
👮🏻‍♂️┇*اضف* *مدير* ↭ *تنزيل* *مدير*
👨🏻‍🔧┇*اضف* *ادمن* ↭ *تنزيل* *ادمن*
👨🏻‍🎤┇*اضف* *مميز* ↭ *تنزيل* *مميز*
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
2⇜ اوامر المنشئ  ⬇️

🗑┇*مسح* *الادمنيه* ↭ *لمسح* *الادمنيه*
🗑┇*مسح* *المميزين* ↭ *لمسح* *المميزين*
🗑┇*مسح* *المدراء* ↭ *لمسح* *المدراء* 
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
3⇜ اوامـر الحظـر والطــرد والتقيد ⬇️
      
🏌🏻‍♂️┇*حظر* ↭ *لحظر* *العضو*
🏌🏻‍♂️┇*الغاء* *حظر* ↭ *لالغاء* *حظر* *العضو*
🏌🏻‍♂️┇*طرد* ↭ *لطرد* *العضو* 
🔇┇*كتم* ↭ *لكتم* *العضو* 
🔈┇*الغاء* *كتم* ↭ *لالغاء* *كتم* *العضو*
🏮┇*تقييد* ↭ *لتقيد* *العضو*
🏮┇*الغاء* *تقييد* ↭ *لالغاء* *تقيد* *العضو*
🚫┇*منع* + *الكلمه* ⇜ *لمنع* *كلمه*
⏺️┇*الغاء* *منع* ⇜ *لالغاء* *منع* *الكلمه*
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ

👨??‍💻┊ راسلني للاستفسار 💡☜ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
local text = [[
1⇜ اوامر الوضع واضف للمجموعه ⬇️

🙋🏻‍♂️┇*ضع* *الترحيب* ⇜ *لوضع* *ترحيب*
👨🏻‍✈️┇*ضع* *القوانين* ⇜ *لوضع* *القوانين*
📌┇*ضع* *وصف* ⇜ *لوضع* *وصف*
🖇️┇*ضع* *رابط* ⇜ *لوضع* *الرابط*
🖇️┇*الـرابـط* ⇜ *لعرض* *الرابط*
👨🏻‍✈️┇*اضف* *صلاحيه* ⇜ *اعطاء* *صلاحيه* *للعضو*
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
2⇜ اوامر رؤية الاعدادات ⬇️

👨🏻‍🔧┇*الادمنيه* ↭ *لعرض* *الادمنيه*
👮🏻‍♂️┇*المدراء* ↭ *لعرض* *المدراء*
🔇┇*المكتومين* ↭ *لعرض* *المكتومين*
🤺┇*الحمايه* ↭ *لعرض* *كل* *الاعدادات* 
🎆┇*الوسائط* ↭ *لعرض* *اعدادات* *الميديا*
👨🏻‍✈️┇*القوانين* ↭ *لعرض* *القوانين* 
🚫┇*المحظورين* ↭ *لعرض* *قائمة* *المحظورين*
🔧┇*الاعدادات* ↭ *لعرض* *اعدادات* *المجموعه* 
🌬️┇*المجموعه* ↭ *لعرض* *معلومات* *المجموعه*
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ

👨🏻‍💻┊راسلني للاستفسار 💡☜ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
local text = [[
📮┇اوامر حمايه المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ء
⏺┇*قفل* ⇜ *فتح*
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ء
🔐┇*الـتـعـديـل*
🔐┇*الـبــصـمـات*
🔐┇*الـفـيـديـو*
🔐┇*الــصــور*
🔐┇*الـمـلـصـقـات*
🔐┇*الـمـتـحـركـه*
🔐┇*الــدردشـه*
🔐┇*الــروابـط*
🔐┇*الــتــاك*
🔐┇*الـبـوتـات*
🔐┇*الــمــعــرفـات*
🔐┇*الـبـوتـات* *بالـطـرد*
🔐┇*الــمــيـديـا*
🔐┇*الــكــلايـش*
🔐┇*الــتــكــرار*
🔐┇*التوجــيــه *
🔐┇*الانــلايــن*
🔐┇*الــجـهـات*
🔐┇*الــكـــل*
🔐┇*الــدخـول*
🔐┇*هــمـسـه*
🔐┇*الــفــارسـيـه*
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
2⇜ *القفل* *بالتقيد* ⬇️

🔐┇*التوجيه* *بالتقيد*
🔐┇*الروابط* *بالتقيد*
🔐┇*المتحركه* *بالتقيد*
🔐┇*الصور* *بالتقيد*
🔐┇*الفيديو* *بالتقيد*
🔐┇*الفارسيه* *بالتقيد*
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
3⇜ *التفعيل* *و* *التعطيل* ⬇️

🙋🏻‍♂️┇*تفعيل* «» *تعطيل* ❪ *الترحيب* ❫
📌┇*تفعيل* «» *تعطيل* ❪ *الردود* ❫
🚫┇*تفعيل* «» *تعطيل* ❪ *التحذير* ❫
📌┇*تفعيل* «» *تعطيل* ❪ *الايدي* ❫
👨🏻‍✈️┇*تفعيل* «» *تعطيل* ❪ *الرفع* ❫
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ

👨🏻‍💻┊ للاستفسار 💡☜ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local text = [[
👮🏻‍♂️┇اوامر الخدمه  ⬇️

📌┇ايدي ⇜ لعرض صورتك + معلوماتك
📌┇ايديي ⇜ لعرض ايديك
📌┇ايدي بالرد ⇜ لعرض ايدي الشخص
☎️┇جهاتي ⇜ لمعرفه عدد جهاتك
🖇️┇الرابط ⇜ لستخراج رابط المجموعه
📍┇معلوماتي ⇜ لعرض معلوماتك
🎮┇الالعاب ⇜ لعرض العاب البوت
🏆┇مجوهراتي ⇜ عدد مجوهراتك
🏆┇بيع مجوهراتي + العدد ⇜ حصول على رسائل 
➰┇الرتبه بالرد ⇜ لمعرفه رتبة الشخص
🏷️┇التفاعل بالرد/بالمعرف ⇜ لمعرفة تفاعل الشخص 
📌┇ايدي العضو ⇜ لمعرفه معلومات حسابه 
⏺️┇طرد البوتات ⇜ لطرد كل البوتات
⏺️┇طرد المحذوفين ⇜ لطرد الحسابات المحذوفه
🤖┇كشف البوتات ⇜ لاضهار عدد البوتات الموجوده
🃏┇الدعم ⇜ لمنادات المطور اساسي
🃏┇رابط الحذف ⇜ لحذف حساب تلكرام 
🃏┇زخرفه ⇜ لزخرفه اي شئ تريد 
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ

👨🏻‍💻┊راسلني للاستفسار 💡☜ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "م5" then
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
local text = [[
👨🏻‍💻┇اوامر المطور  ⬇️
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
♻️┇تفعيل / تعطيل
👨🏻‍🎤┇اسم بوتك + غادر ↭ لطرد البوت
👨🏻‍✈️┇اضف /تنزيل ↭  منشئ اساسي
🗑️┇مسح المدراء ↭ لمسح المدراء 
🗑️┇مسح الادمنيه ↭ لمسح الادمنيه 
🗑️┇مسح المميزين ↭ لمسح المميزين 
🗑️┇مسح المطورين ↭ لمسح كل المطورين
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
🗣┇اذاعه ↭ لنشر رساله للمجموعات
🗣┇اذاعه خاص ↭ لنشر رساله خاص
🗣┇اذاعه عام بالتوجيه ↭ لنشر توجيه من قناتك
📊┇تنظيف المجموعات
📌┇تنظيف المشتركين
📊┇جلب الكروبات ↭ جلب نسخه احتياطيه
📊┇رفع الكروبات ↭ رفع نسخه احتياطيه
🤖┇ضع اسم للبوت ↭ لوضع اسم البوت
⏺️┇حظر عام ↭ بالمعرف / بالرد
🔭┇الغاء العام ↭ بالمعرف / بالرد
♻️┇تحديث ↭ لتحديث ملفات البوت
♻️┇تحديث السورس ↭ لتحديث السورس 
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ

👨🏻‍💻┇راسلني للاستفسار 💡☜ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م6' then
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
local text = [[
👮🏻‍♂️┇جميع اوامر الردود ⬇️
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
📌┇الردود ⇜ لعرض الردود المثبته
📌┇اضف رد ⇜ لأضافه رد جديد
📌┇مسح رد  ⇜ الرد المراد مسحه
📌┇مسح الردود ⇜ لمسح كل الردود
📌┇الردود العامه ⇜ لمعرف الردود المثبته عام 
📌┇اضف رد عام ⇜ لاضافه رد لكل المجموعات
📌┇مسح رد عام ⇜ لمسح الرد العام 
📌┇مسح الردود العامه ⇜ لمسح كل ردود العامه
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
👨🏻‍💻┇راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'lave_me'..msg.chat_id_) then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇* المغادره بالتاكيد تم تفعيلها ☑️" 
else 
redis:del(brothers..'lave_me'..msg.chat_id_) 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇* تم تفعيل المغادره ☑️" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..'lave_me'..msg.chat_id_) then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇* المغادره من قبل البوت بالتأكيد معطله ☑️" 
else
redis:set(brothers..''..msg.chat_id_,true)  
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇* تم تعطيل المغادره من قبل البوت ☑️" 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(brothers..'lave_me'..msg.chat_id_) then
if msg.Admin then return "📮*┇*لا استطيع طرد المدراء والادمنيه والمنشئين  ☑️" end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"📮| اهلا عزيزي , لقد تم طردك من المجموعه بامر منك \n🔖| اذا كان هذا بالخطأ او اردت الرجوع للمجموعه \n\n📌┇فهذا رابط المجموعه 💯\n🌿┇"..Flter_Markdown(redis:get(brothers..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(brothers..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"📮| لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"📮| لا استطيع طردك لانك مشرف في المجموعه  ")
end
end)
return false
end
end

end 

if MsgText[1] == "سورس" or MsgText[1]=="السورس" then
return [[
📡┇اهلا بك في سورس الاخوين 

📯┇BroTherS TeAm

🔎┇[قناه السورس](t.me/cgngv) 
🔎┇[مطور السورس](t.me/sajad14p) 

🔋┇[كليشه التنصيب](https://t.me/cgngv/273) 


📮┇[لــ تواصل](t.me/rrrrybot)

]]
end

if MsgText[1] == "الساعه" then
return "➖\n⏱| الـسـاعه الان : "..os.date("%I:%M%p").."\n"
.."📆| الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1] == "التاريخ" then
return "➖\n📆| الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "سحكاتي" then
return '🚸*┇*عدد سحہكآتگ ⇜ ❪ '..(redis:get(brothers..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n🐾'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'سحكاتي'  then
local rfih = (redis:get(brothers..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "⚠️*┇*عذرا لا يوجد سحكات لك في البوت  ✖️" end
redis:del(brothers..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "📮*┇*تم مسح {* "..rfih.." *} من سحكاتك ☑️"
end


if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑️" then
if not msg.SudoBase then return"👨🏻‍💻*┇* للمطـور الاساسي فقط" end
if redis:get(brothers..":UserNameChaneel") then
return "📑┊اهلا عزيزي المطور \n🔖┊الاشتراك بالتأكيد مفعل"
else
redis:setex(brothers..":ForceSub:"..msg.sender_user_id_,350,true)
return "📑┊مرحبا بـك في نظام الاشتراك الاجباري\n🔖┊الان ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري ♻️" then
if not msg.SudoBase then return"👨🏻‍💻*┇* للمطور الاساسي فقط" end
local SubDel = redis:del(brothers..":UserNameChaneel")
if SubDel == 1 then
return "🔖┊تم تعطيل الاشتراك الاجباري . \n✓"
else
return "🔖┊الاشتراك الاجباري بالفعل معطل . \n✓"
end
end

if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري 🏌🏿‍♂️" then
if not msg.SudoBase then return"👨🏻‍💻*┇* للمطور الاساسي فقط " end
local UserChaneel = redis:get(brothers..":UserNameChaneel")
if UserChaneel then
return "🔖┊اهلا عزيزي المطور \n🔖┊الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n✓"
else
return "🔖┊لا يوجد قناة مفعله ع الاشتراك الاجباري. \n✓"
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري 🚫" then
if not msg.SudoBase then return"👨🏻‍💻*┇* للمطور الاساسي فقط" end
redis:setex(brothers..":ForceSub:"..msg.sender_user_id_,350,true)
return "📑┊مرحبا بـك في نظام الاشتراك الاجباري\n🔖┊الان ارسل معرف قـنـاتـك"
end





end

local function dbrothers(msg)

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(brothers..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(brothers..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*🏌🏻‍♂️┇* تم حظرك من البوت بسبب التكرار ☑️') 
end
redis:setex(brothers..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then

if msg.SudoBase then
local text = '🙋🏻‍♂┊اهلا عزيزي آلمـطـور ♥\n🔻┊آنت آلمـطـور آلآسـآسـي هنآ 🛠\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n\n🚸┊تسـتطـيع‌‏ آلتحگم بكل آلآوآمـر آلمـمـوجودهہ‌‏ بآلگيبورد الخاص بالبوت\n🔺┊فقط آضـغط ع آلآمـر آلذي تريد تنفيذهہ‌‏'
local keyboard = {
{"ضع اسم للبوت ©","ضع صوره للترحيب 🏞️"},
 {"تعطيل التواصل ✖️","تفعيل التواصل 🔛"},
{"تعطيل البوت خدمي","تفعيل البوت خدمي","المطورين 👷"},
 {"المشتركين 📌","المجموعات ⌛","الاحصائيات 📊"},
 {"اضف رد عام 📯","الردود العامه 📮"},
 {"اذاعه 📣","اذاعه خاص 🗃️"},
{"اذاعه عام 📢","اذاعه عام بالتوجيه 📻"},
 {"تحديث ♻️","قائمه العام 🚫","ايديي📌"},
{"تعطيل الاشتراك الاجباري ♻️","تفعيل الاشتراك الاجباري ☑️"},
{"تغيير الاشتراك الاجباري 🚫","الاشتراك الاجباري 🏌🏿‍♂️"},
{"تنظيف المشتركين 📤","تنظيف المجموعات 📊"},
{"جلب الكروبات","رفع الكروبات"},
{"server"},
 {"قناة السورس 📡"},
 {"تحديث السورس ™"},
 {"الغاء الامر ✖️"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(brothers..'users',msg.sender_user_id_)
if redis:get(brothers..'lock_service') then 
text = [[⚜┊اهلا انآ بوت آسـمـي   []]..redis:get(brothers..':NameBot:')..[[] 🎖
📮┊آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
📈┊مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...
📮┊لتفعيل البوت اتبع مايلي
⌨┊اضف البوت الى المجموعه
⌨┊ارفع البوت ادمن في المجموعه
⌨┊وارسل تفعيل وسيتم تفعيل البوت ورفع مشرفي الكروب تلقائين 
🖲┊ [اضغط هنا دخول لقناة سورس ](t.me/cgngv) •
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
👮┊مـعـرف الـمـطـور : ]]..SUDO_USER..[[
]]
else
text = [[⚜┊اهلا انآ بوت آسـمـي  []]..redis:get(brothers..':NameBot:')..[[] 🎖
👮┊آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
📌┊مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...
🏷┊فقط آلمـطـور يسـتطـيع تفعيل آلبوت
🖲┊ [اضغط هنا دخول لقناة سورس ](t.me/cgngv) •
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
💌┊لتفعيل البوت راسلني 
👮┊مـعـرف الـمـطـور  : ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="مـطـور الـبـوت ✓",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(brothers.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"📮┇تم آرسـآل آلرسـآل‏‏هہ 🌿\n🎟┇آلى : "..USERNAME.." 🏌🏻",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(brothers..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"📮┇عذرآ لآ يمـگنگ آرسـآل { توجيهہ‌‏ , مـلصـق , فديو گآم} ☑️")
return false
end
redis:setex(brothers.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"🗯┊تم آرسـآل رسـآلتگ آلى آلمـطـور\n📬┊سـآرد عليگ في آقرب وقت\n👨‍✈️┊معرف المطور "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

--====================== Reply Only Group ====================================
if redis:get(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(brothers..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(brothers..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(brothers..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ✓ تم اضافت الرد 🚀 \n-')
elseif msg.photo then 
redis:hset(brothers..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه صوره للرد بنجاح ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(brothers..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه بصمه صوت للرد بنجاح ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(brothers..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه متحركه للرد بنجاح ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوره الاتيه ')
elseif msg.video then
redis:hset(brothers..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه فيديو للرد بنجاح ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(brothers..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه للصوت للرد بنجاح ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(brothers..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه ملصق للرد بنجاح ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الملصق الاتي ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(brothers..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(brothers..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(brothers..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ✓ تم اضافت الرد لكل المجموعات 🚀 ')
elseif msg.photo then 
redis:hset(brothers..'replay_photo:group:',klma,photo_id)
redis:del(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه صوره للرد العام ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(brothers..'replay_voice:group:',klma,voice_id)
redis:del(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه بصمه صوت للرد العام ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(brothers..'replay_animation:group:',klma,animation_id)
redis:del(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه متحركه للرد العام ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوره الاتيه ')
elseif msg.video then
redis:hset(brothers..'replay_video:group:',klma,video_id)
redis:del(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه فيديو للرد العام ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵لاضهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(brothers..'replay_audio:group:',klma,audio_id)
redis:del(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه للصوت للرد العام ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(brothers..'replay_sticker:group:',klma,sticker_id)
redis:del(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂┊تم اضافه ملصق للرد العام ✓\n🗂┇يمكنك ارسال ❴ ['..klma..'] ❵ لاضهار الملصق الاتي ')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
local Text = msg.text
local UserID =  msg.sender_user_id_
if msg.SudoBase then
if Text == "تعين الايدي" then
redis:setex("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
local tahaid= [[
*📊¦ اهلابك عزيزي  
📑¦تستطيع الان تغير كليشه الايدي 📣
  ••••••••••••••••••••••••••••
 •  الايدي •* `IDGET`
*• رتبتي • * `RTBGET`
*• المعرف • * `USERGET`
*• رسائلك • * `MSGGET`
*•سحكاتك • * `edited`
*• تفاعلك • * `TFGET`
*• جهاتك • * `adduser`
*•مجوهراتك • * `User_Points`

]]
return sendMsg(msg.chat_id_,msg.id_,tahaid) 
end
if Text == 'مسح الايدي' or Text == 'حذف تغير الايدي' then
redis:del("KLISH:ID")
sendMsg(msg.chat_id_,msg.id_,"📮*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📌*¦* تم حذف كليشه الايدي ☑️")
return false  
end
if redis:get("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) then 
if Text == "الغاء" then 
sendMsg(msg.chat_id_,msg.id_,"*📮¦ تم الغاء الامر *☑️")
redis:del("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end 
redis:del("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
local CHENGER_ID = Text:match("(.*)")  
redis:set("KLISH:ID",CHENGER_ID)
sendMsg(msg.chat_id_,msg.id_,'\n*📮¦ تم تغير كليشه الايدي بنجاح* ☑️')
end

end

if redis:get(brothers..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(brothers..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"📑┊عذرا , هناك خطأ لديك \n🔖┊المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"📑┊عذرا , لقد نسيت شيئا \n🔖┊يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(brothers..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"🔖┊جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\n📮┊على قناتك ⇜ ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"📑┊عذرا , عزيزي المطور \n🔖┊هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(brothers..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(brothers..'namebot:witting'..msg.sender_user_id_)
redis:set(brothers..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"📮┊تم تغير اسم البوت  \n📌┊الان اسمه "..Flter_Markdown(msg.text).." \n✓")
return false
end

if redis:get(brothers..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(brothers..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(brothers..'replay_photo:group:',msg.text)
redis:hdel(brothers..'replay_voice:group:',msg.text)
redis:hdel(brothers..'replay_animation:group:',msg.text)
redis:hdel(brothers..'replay_audio:group:',msg.text)
redis:hdel(brothers..'replay_sticker:group:',msg.text)
redis:hdel(brothers..'replay_video:group:',msg.text)
redis:setex(brothers..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"📮┊جيد , يمكنك الان ارسال جوا ب الردالعام \n📌┊[[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ☑️")
end
end

if redis:get(brothers..'delrdall:'..msg.sender_user_id_) then
redis:del(brothers..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(brothers..'replay:all',msg.text)
local photo =redis:hget(brothers..'replay_photo:group:',msg.text)
local voice = redis:hget(brothers..'replay_voice:group:',msg.text)
local animation = redis:hget(brothers..'replay_animation:group:',msg.text)
local audio = redis:hget(brothers..'replay_audio:group:',msg.text)
local sticker = redis:hget(brothers..'replay_sticker:group:',msg.text)
local video = redis:hget(brothers..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'📮*┊*هذا الرد ليس مضاف في قائمه الردود ☑️')
else
redis:hdel(brothers..'replay:all',msg.text)
redis:hdel(brothers..'replay_photo:group:',msg.text)
redis:hdel(brothers..'replay_voice:group:',msg.text)
redis:hdel(brothers..'replay_audio:group:',msg.text)
redis:hdel(brothers..'replay_animation:group:',msg.text)
redis:hdel(brothers..'replay_sticker:group:',msg.text)
redis:hdel(brothers..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n  ✓ تم مسح الرد 📮 ')
end 
end 


if redis:get(brothers..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(brothers..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(brothers..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "📜*┇* تم وضع الكليشه بنجاح كلاتي 👋🏻\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n✓")
end
if redis:get(brothers..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(brothers..'welcom:witting'..msg.sender_user_id_) 
redis:set(brothers..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"📜*┇* تم وضع الترحيب بنجاح كلاتي 👋\n✓" )
end
if redis:get(brothers..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(brothers..'rulse:witting'..msg.sender_user_id_) 
redis:set(brothers..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'📜*┇* مرحبآ عزيزي\n📦┇تم حفظ القوانين بنجاح ✓\n🔖┇ارسل [[ القوانين ]] لعرضها \n💬✓')
end
if redis:get(brothers..'rulse:wittingg'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(brothers..'rulse:wittingg'..msg.sender_user_id_) 
redis:set(brothers..'rulse:msgg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'📜*┇* مرحبآ عزيزي\n📦┇تم حفظ الرابط بنجاح ✓\n🔖┇ارسل [[ رابط ]] لعرض الرابط \n💬✓')
end
if redis:get(brothers..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(brothers..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(brothers..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(brothers..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"📜*┇* تم وضع الوصف بنجاح\n✓")
end 
end,nil)
end


if redis:get(brothers..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(brothers..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(brothers..'users')  
local groups = redis:smembers(brothers..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'📑┊اهلا عزيزي المطور \n🔖┊جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(brothers..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'📜*┊*تم اذاعه الكليشه بنجاح 🏌🏻\n🗣*┊*للمـجمـوعآت » ❴ *'..#groups..'* ❵ گروب \n👥*┇* للمـشـترگين » ❴ '..#pv..' ❵ مـشـترگ \n✓')
end

if redis:get(brothers..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(brothers..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(brothers..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'📑┊اهلا عزيزي المطور \n🔖┊جاري نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(brothers..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'🙍🏻‍♂*┊*عدد المشتركين : ❴ '..#pv..' ❵\n🗣*┊*تم الاذاعه الى ❴ '..SenderOk..'  ❵ مشترك \n ✓') 
end
end)
end
end

if redis:get(brothers..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(brothers..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(brothers..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'📑┊اهلا عزيزي المطور \n🔖┊جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = '📛*┊*تم حذف ❴ *'..NumGroupsDel..'* ❵ من قائمه الاذاعه لانهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'📑*┊*عدد المجموعات ❴ *'..#groups..'* ❵\n🗣*┊*تـم الاذاعه الى ❴ *'..AllGroupSend..'* ❵\n'..MsgTDel..'✓')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(brothers..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(brothers..':WELCOME_BOT'),[[⚜┊اهلا انآ بوت آسـمـي ]]..redis:get(brothers..':NameBot:')..[[ ✓
🏷┊آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت
📌┊مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...
🖲┊ [اضغط هنا دخول لقتاة سورس ](t.me/cgngv) •
👮┊مـعـرف الـمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
]])
return false
end 

if msg.forward_info and redis:get(brothers..'fwd:'..msg.sender_user_id_) then
redis:del(brothers..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(brothers..'users')
local groups = redis:smembers(brothers..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'📑┊اهلا عزيزي المطور \n🔖┊جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'📜*┊*تم اذاعه التوجيه بنجاح 🏌🏻\n🗣*┊*للمـجمـوعآت » ❴ *'..#groups..'* ❵\n👥*┊*للخآص » ❴ '..#pv..' ❵\n✓')			
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." غادر$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'🚦┊طبكم مرض حغادر باي 💔🚶‍♂') 
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.photo and redis:get(brothers..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(brothers..'welcom_ph:witting'..msg.sender_user_id_)
redis:set(brothers..':WELCOME_BOT',photo_id)
sendMsg(msg.chat_id_,msg.id_,'🚸┇تم تغيير صـورهہ‏‏ آلترحيب للبوت 🌿\n✓')
return false
end 

if msg.photo and msg.type == "channel" and msg.GroupActive then
if redis:get(brothers..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(brothers..'photo:group'..msg.chat_id_..msg.sender_user_id_)
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.ID == "Ok" then
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'🚸┇ليس لدي صلاحيه تغيير الصوره \n🤖 ┇يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end,nil)
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(brothers..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(brothers..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(brothers..'replay:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(brothers..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"📮┊جيد , يمكنك الان ارسال جواب الرد \n📌┊[[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ☑️")
end
end

if redis:get(brothers..'delrd:'..msg.sender_user_id_) then
redis:del(brothers..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(brothers..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(brothers..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(brothers..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(brothers..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(brothers..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(brothers..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(brothers..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'📮*┊*هذا الرد ليس مضاف في قائمه الردود ☑️')
else
redis:hdel(brothers..'replay:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(brothers..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n  ✓ تم مسح الرد 🚀 ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(brothers..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(brothers..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"📮*┇* عذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم ☑️")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"📮*┇* عذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت ☑️")      
end
end,nil)
end
return false
end
redis:set(brothers..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغير صوره المجموعه ☑️")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(brothers..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"📮| قام  ["..UserName.."]\n📌┇بتغير اسم المجموعه  \n⏺️┇الى "..Flter_Markdown(msg.content_.title_).." \n✓") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(brothers..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(brothers..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(brothers..'welcome:msg'..msg.chat_id_) or "🙋🏻‍♂┇اهلن بك عزيزي {الاسم}\n🎟┇معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين ♥\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n⚜┇اسم الكروب » {المجموعه}")
if welcome then
rules = (redis:get(brothers..'rulse:msg'..msg.chat_id_) or "👨🏻‍💻┇مرحبأ عزيري القوانين كلاتي 👇🏻\n♦️┇ممنوع نشر الروابط\n⚠️┇ممنوع التكلم او نشر صور اباحيه\n⚔┇ممنوع  اعاده توجيه\n💭┇ممنوع التكلم بلطائفه\n♥️┇الرجاء احترام المدراء والادمنيه 😅\n")
welcome = welcome:gsub("{القوانين}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(brothers..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(brothers..'welcome:msg'..msg.chat_id_) or "🙋🏻‍♂┇اهلن بك عزيزي {الاسم}\n🎟┇معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين ♥\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n⚜┇اسم الكروب » {المجموعه}")
if welcome then
rules = (redis:get(brothers..'rulse:msg'..msg.chat_id_) or "👨🏻‍💻┇مرحبأ عزيري القوانين كلاتي 👇🏻\n♦️┇ممنوع نشر الروابط\n⚠️┇ممنوع التكلم او نشر صور اباحيه\n⚔┇ممنوع  اعاده توجيه\n💭┇ممنوع التكلم بلطائفه\n♥️┇الرجاء احترام المدراء والادمنيه ??\n")
welcome = welcome:gsub("{القوانين}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(brothers..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

--------------------------------------------
if msg.adduser and redis:get(brothers..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(brothers..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(brothers..'welcome:get'..msg.chat_id_)
end
redis:setex(brothers..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(brothers..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(brothers..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(brothers..'num_msg_brothers'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(brothers..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"📮┇العضو » "..USERNAME.."\n📌┇قمـت بتگرآر آگثر مـن "..NUM_MSG_MAX.." رسـآلهہ‌‏ , لذآ تم تقييدگ مـن آلمـجمـوعهہ‌‏ ☑️",12,USERCAR) 
return false
end)
end 
redis:setex(brothers..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'🚸┇صلاحياته منشئ الكروب\n🍃')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'🚸┇مجرد عضو هنا\n🍃')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end
return sendMsg(chat,msg.id_,'📌┇الرتبة : مشرف 🍃\n💢┇والصلاحيات هي ⇓ \nـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n📝┇تغير معلومات المجموعه ↞ ❪ '..info..' ❫\n📨┇حذف الرسائل ↞ ❪ '..delete..' ❫\n🚷┇حظر المستخدمين ↞ ❪ '..restrict..' ❫\n♻┇دعوة مستخدمين ↞ ❪ '..invite..' ❫\n🔘┇تثبيت الرسائل ↞ ❪ '..pin..' ❫\n🚸┇اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\n💠┇ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(brothers..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) and not redis:get(brothers..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع اعادة التوجيه  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(brothers..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(brothers..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(brothers..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا الانلاين مقفول  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(brothers..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(brothers..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(brothers..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇ممنوع ارسال الروابط  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(brothers..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇ممنوع ارسال روابط الويب   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(brothers..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇ممنوع ارسال التاك  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(brothers..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇ممنوع ارسال المعرف   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(brothers..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇ممنوع ارسال الماركدوان  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(brothers..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇ .ممنوع ارسال روابط الويب   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(brothers..'lock_edit'..msg.chat_id_) then -- قفل الميديا
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇اوو لا يمكن تعديل \n📑┇ الميديا مقفوله"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"📮┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(brothers..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'??*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الفيديو كام \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(brothers..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الصور  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(brothers..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(brothers..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الفيديو  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(brothers..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(brothers..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
 if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الملفات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(brothers..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الملصقات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(brothers..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الصور المتحركه  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(brothers..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(brothers..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
 if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال جهات الاتصال  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(brothers..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
 if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الموقع  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(brothers..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
 if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال البصمات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(brothers..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "┇┇عذرا ممنوع لعب الالعاب  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(brothers..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الصوت  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(brothers..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا الكيبورد مقفول  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(brothers..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال الروابط  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(brothers..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "♦️┇عذرا ممنوع ارسال روابط الويب  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(brothers..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*┇* لا يمكنني مسح الرساله المخالفه .\n🎟*┇* لست مشرف او ليس لدي صلاحيه  الحذف \n 💥')    
end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then
local msgx = "♦️┇عذرا ممنوع ارسال التاك او المعرف  \n📛"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🙍🏻‍♂┇العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text and redis:get(brothers..'replay'..msg.chat_id_) then

local Replay = false

 Replay = redis:hget(brothers..'replay:all',msg.text)
if Replay then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(brothers..'replay:'..msg.chat_id_,msg.text)
if Replay then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(brothers..'replay_photo:group:',msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(brothers..'replay_voice:group:',msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(brothers..'replay_animation:group:',msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(brothers..'replay_audio:group:',msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(brothers..'replay_sticker:group:',msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(brothers..'replay_video:group:',msg.text)
if Replay then 
print("0000000000000") 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(brothers..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(brothers..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(brothers..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(brothers..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(brothers..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(brothers..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

if not Replay then

--================================{{  Reply Bot  }} ===================================

local su = {
"نعم حبيبي المطور 🌝❤",
"هايروحي كٌْـْـًْْـٍْ☝ــًْوًٌْل😻❤️",
"ها يابــعد دگــات كِـུ֘͢ـ᷀͛❤️ـۢۢۢ͜͢͡ـلُـུ֤͋꩸֤ـֿ֤ࣵـبّـيَ🤤❤️",
"يابعد روح ["..Bot_Name.."] 😘❤️",
"هلا بمطوري العشق أمرني"}
local ss97 = {
"ها حياتي😻","عيونه 👀 وخشمه 👃🏻واذانه👂🏻",
"باقي ويتمدد 😎","ها حبي 😍","ها عمري 🌹","اجيت اجيت كافي لتصيح 🌚👌",
"هياتني اجيت 🌚❤️","نعم حبي 😎","هوه غير يسكت عاد ها شتريد 😷",
"احجي بسرعه شتريد 😤","ها يا كلبي ❤️","هم صاحو عليه راح ابدل اسمي من وراكم 😡",
"لك فداك ["..Bot_Name.."] حبيبي انت اموووح 💋","دا اشرب جاي تعال غير وكت 😌","كول حبيبي أمرني 😍",
"احجي فضني شرايد ولا اصير ضريف ودكلي جرايد لو مجلات تره بايخه 😒😏",
"اشتعلو اهل ["..Bot_Name.."] شتريد 😠","بووووووووو 👻 ها ها فزيت شفتك شفتك لا تحلف 😂",
"طالع مموجود 😒","هااا شنوو اكو حاته بالكروب وصحت عليه  😍💕","انت مو قبل يومين غلطت عليه؟  😒",
"تروح فدوه الأسمي الوصخ شتري؟ مولبارحه رزلتك يوميه ازلك شبيك😑😹","ياعيون ["..Bot_Name.."] أمرني 😍",
"لك دبدل ملابسي اطلع برااااا 😵😡 ناس متستحي","سويت هواي شغلات سخيفه بحياتي بس عمري مصحت على واحد وكلتله انجب 😑",
"مشغول ويا ضلعتي  ☺️","مازا تريد منه 😌🍃"
}
local bs = {
"*بيهه* *كوخهه* *مابوسهه* 😹💔",
"اآآآم͠ــ.❤️😍ــو͠و͠و͠آ͠آ͠ح͠❤️عسسـل❤️",
"الوجه ميساعد 😐✋",
"ممممح😘ححح😍😍💋",
}
local ns = {
" اﮫلاوات* *؏ــمري* *نورت* ☻♥",
"*هلاوات* *نورت* *يكمر 💮💗*",
"*هلاوات* *يعسل 🍯🐝*",
"*هلاوات* *كلبي* *نورت* 🍫",
}
local sh = {
" *ﮪلاوات* *مطوري* *العشق* *يعني* *العافيه* ☺♥",
" *ﯝفف* *نورت* *المطور* *مال* *انهه* ☹♥",
}
local lovm = {
"*اكرهك* 😒👌🏿",
"*منو* *لـ* *كلك* *احبك* 😒👌🏻",
"*دي* 😑👊🏾",
"*موتبيكك* *مححا* 😻🙊",
"*عشقكك* *يروحيي* *انتا* 😻🙈",
"*والله* *ماحبك* *لتلح* 😹",
"*مـــوتبيك* *عمريي* *انتاا* ☹️",
"*اذا* *كتلك* *حبك* *شراح* *تستفاد* 😕❤️",
"*ولي* *ماحبك* 🙊💔",
}
local song = {
"خنكني حتا الهوا على العين😭مامر ضوا ضوجه☹️وكبر هميي يمعشوك😍روحيي القوي انا بنار🔥جاي انجوي🔥من انتا مو يمي🚶🏿‍♂شفت الناس كلمن عشك😍وبلياك انيي احترك🔥محد رحم بيهه☹️شفت الموت⚰بدونك انيي شلونك بدوني بعد ماكو ملامح فرحهه😔بعيوني مااحجي وابجي😭بقهرر مثل الموت⚰من البشر مااعرف شبيه☹️🚶🏿‍♂",
"لو تدري بياا اصار مشتعل كلبي❤️بنار🔥 يلكلبك انتا حجار حس مرا بياا🙂تنزل دموع😭العين كل ماشوف ثنين💏مو جنه زعلانين😒حس مرا بياا كون احضنك🤭لصبح وانام😴انطيني الحب😍العندك وغرام❤️هاذا بعدك والله اكبر حرام😔 ولو تدري بيا اصار مشتعل كلبي❤️بنار🔥🚶🏿‍♂","شلون اعلمك الحنيه🌚خوما بلكوه هيهه شوكت😕ناوي ترد اليه🚶🏿‍♂هواي غيبتك طالت عليهه☹️نعم انتا كاطع بيا🙁كول هم هاذا خطيه🥺مالك يحبيبي😍جيهه هوايهه غيبتك طالت عليهه☹️وحالي حالي حالي💘حس بحالي يلغالي🥺 انه بعدك عذب حالي☹️حالي حالي حالي انهه بعدكك عذب حالي😔💘",
"لتإذي كلبيي❤️وتوب ماعنديي سبع كلوب💕بس انتا لي محبوب💗 ماعندي غيرك🤦🏿‍♂لك انا اموت عليكك☹️ليليه افكرر بيكك مشغول☹️انا بطاريك",
"مانسيتك وكلكيتك اثر ضلعك🙇🏿‍♂💔على ضلوعيي☹️من حضنتك🤤وكلكيتك ابالي🤔يفتر يوم الاول من عرفتك مانسيتك😔فلشتني والله من فركاك صدك فلشتني☹️ماشفتني الاعمى شاف شصار☹️بياا ماشفتني💔🚶🏿‍♂",
"عالم ثاني انتا ويايه😍صوتك🗣بس هوا الراحه🥳طير بكلبي❤️انتا جناحهه🕊كلبي بحبك ميتت حيلل☹️جاهل👶🏻لو حب😍وكاحه من شفتك👄رايد بوسهه😘يلشفتك👄ماملموسه من بطن امكك👵🏻حب عيونكك متروسهه💋🏃🏿‍♂",
}
local he = {"لوكي وزاحف من ساع زحفلي وحضرته 😒","خوش ولد و ورده مال الله 💋🙄","يلعب ع البنات 🙄","ولد زايعته الكاع 😶🙊","صاك يخبل ومعضل","محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️","اموت عليه 🌝","هوه غير الحب مال اني 🤓❤️","مو خوش ولد صراحه ☹️","ادبسز وميحترم البنات","فد واحد قذر 🙄😒","ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️","مو خوش ولد 🤓",
}
local she = {"الكبد مال اني هيه","ختولي ماحبها","خانتني ويه صديقي 😔","بس لو الكفها اله اعضها 💔","خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒","جذابه ومنافقه سوتلي مشكله ويه الحب مالتي","ئووووووووف اموت ع ربها","7ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفوون","صديقتي وختي وروحي وحياتي","فد وحده منحرفه 😥","ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐","ام سحوره سحرت اخويا وعلكته 6 سنوات ??","ماحبها 🙁","بله هاي جهره تسئل عليها ؟","بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼","ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹",
}
local hss = {"على أشباهي أن يشعروا بالفخر ، لأني ضمن مجموعتهم🙂","اذا ارت ان تـَـثق بـَ ﺄحـّد فـَ ﺄعام بأن بليـِس ڪـَان مـْن المـَلائڪهہ​˷👌🏻🖤","ٲنـا لَـسـت لٲحـٰدّ و لـا ٲحـد لِــٰي 🍁\nٲنَا إنّـٰسان غَـريب سـاعِد من يَحتاجني و ٲخختفي 💚🌝","الغريب في الأمر أنّي أخاف الوحدة 🙆‍♂ ولكنّي أسعى لها دائماً ! 💔","‏أصنع السعادة بنفسك ، لا تنتظر من الآخرين ان يصنعوها  لك 💛","‏فلعل الله يغير من أجلك كل شيء , ليرضيك و يُرضي قلبك من حيث لا تدري 💛","كـل شـي يـرحـل فـكـن صـبـورآ ......☺️♥️","الـحـقـيـقـه الـثـابـتـه عـنـي، #حسوني\nأمـنـح فـرص كـثـيـرة جـَدآ وحـين تـنـتـهٓي\nلا أعـاتٓب ولا أسـأل ولا أهـتـم 🙂","آړﯼ آݪڪثـي٘ـړ ݪڪن ݪا آمّٰـي٘ـݪ ݪـ آحـــڊ۟،🌝♥️",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^كول (.*)$") then
if utf8.len(Text:match("^كول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"📛| ما اكدر اكول اكثر من 500 حرف 🙌🏾")
end
local callback_Text = FlterName(Text:match("^كول (.*)$"),50)
if callback_Text and callback_Text == 'الاسم سبام 📛' then
return sendMsg(msg.chat_id_,msg.id_,"📛| للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif Text:match("^"..Bot_Name.." اتفل (.*)$") then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'اوك سيدي 🌝🍃')
sendMsg(msg.chat_id_,msg.reply_id,'لك شنو هاذه ويهك ختفوووووووووو💦💦️️ بنص ويهك 😹')
else 
return sendMsg(msg.chat_id_,msg.id_,"  🕵🏻 وينه بله سويله رد 🙄")
end
elseif Text:match("^"..Bot_Name.." رزله(.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'اوك سيدي 🌝🍃')
return sendMsg(msg.chat_id_,msg.reply_id,'تعال هيوو  😒 شو طالعه عينك ولسانك طويل سربوت  اشو تعال بله شنو هاذ ويهك هاذ 😳 كول بلعباس , 😅 لك #دي وتفو بعد لتندك بتاج راسك خوش حمبقلبي  👍🏿') 
end
elseif Text:match("^بوس (.*)$") then 
if msg.reply_id then 
return sendMsg(msg.chat_id_,msg.reply_id,bs[math.random(#bs)])
else
return sendMsg(msg.chat_id_,msg.id_,"📌 وينه بله سويله رد 🕵🏻")
end 
elseif msg.SudoUser and Text=="هلو" then 
return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
elseif not msg.SudoUser and Text=="هلو" then 
return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
elseif msg.SudoUser and Text== "احبك" then 
return sendMsg(msg.chat_id_,msg.id_,"اموت عليك حياتي  😍❤️")
elseif msg.SudoUser and Text== "تحبني" or Text=="حبك" then 
return sendMsg(msg.chat_id_,msg.id_,"اموت عليك حياتي  😍❤️")
elseif not msg.SudoUser and Text== "احبك" or Text=="حبك" then 
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif not msg.SudoUser and Text== "تحبني" then
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif Text== "غني" or Text=="غنيلي" then 
return sendMsg(msg.chat_id_,msg.id_,song[math.random(#song)])
elseif Text== "شنو رئيك بهاذا" or Text== "شنو رئيك بي" or Text== "شنو رئيك بهاذه" then 
return sendMsg(msg.chat_id_,msg.id_,he[math.random(#he)])
elseif Text== "شنو رئيك بهاي" or Text=="شنو رئيك بيه" or Text== "شنو رئيك بهاذش" then 
return sendMsg(msg.chat_id_,msg.id_,she[math.random(#she)])
elseif Text== "حسوني" or Text=="حسون" or Text== "حسن" then 
elseif Text:match("^"..Bot_Name.." هينه(.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'عمري انتا رح اخرطه نعل 😹')
return sendMsg(msg.chat_id_,msg.reply_id,'زربا عليكك وع الخلفوكك ياخرا يبن الخرا شنو تبقا متعرف تحجي انتا نبقا نعلم بيكك مثل صير مثقف شوياا خلك،،😹🙈') 
end
elseif Text:match("^"..Bot_Name.." بوسه(.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'تدلل حبي 😻')
return sendMsg(msg.chat_id_,msg.reply_id,'موححححح محاااا محيححححههه محمحههه محات☹️😹💋') 
end
elseif Text:match("^"..Bot_Name.." اتفل(.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'بلخدماا حبي تدلل 😻')
return sendMsg(msg.chat_id_,msg.reply_id,'خخخخخختتتتتتففففففففوووو ابلعععع مو تفله تكلك عسلل برب 😹🙈') 
end
return sendMsg(msg.chat_id_,msg.id_,hss[math.random(#hss)])
elseif Text=="اتفل" or Text=="تفل" then
if msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,'ختفوووووووووو💦💦️️')
else 
return sendMsg(msg.chat_id_,msg.id_,"📌 انجب ما اتفل عيب 😼🙌🏿") 
end
elseif Text:match("^"..Bot_Name.." مصه(.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'تدلل كلبي رح اشلع شفتهه🥺💋')
return sendMsg(msg.chat_id_,msg.reply_id,'ٲٳمٌممممممممممممممممممـۧ﴿🌝💋﴾ـۛويِّحًهٍہ💕⇣ֆ ٲٳمٌممممممممممممممممممـۧ﴿🌝💋﴾ـۛويِّحًهٍہ💕⇣ֆ ٲٳمٌممممممممممممممممممـۧ﴿🌝💋﴾ـۛويِّحًهٍہ💕⇣ֆ ٲٳمٌممممممممممممممممممـۧ﴿🌝💋﴾ـۛويِّحًهٍہ💕⇣ֆ ') 
end
elseif Text== "شلونكم" or Text== "شلونك" or Text== "شونك" or Text== "شونكم" then 
return sendMsg(msg.chat_id_,msg.id_,"تمام وانتا☹️💗")
elseif Text== "وينك"  then return sendMsg(msg.chat_id_,msg.id_," موجود حبي🤹‍♂️")
elseif Text== "منورين"  then return sendMsg(msg.chat_id_,msg.id_,"من نورك عمري ❤️🌺")
elseif Text== "هاي"  then return sendMsg(msg.chat_id_,msg.id_," ھہـآيِٰہآتَہَٰ يِٰہروِحہٰٰيِٰہ 😻👅")
elseif Text== "🙊"  then return sendMsg(msg.chat_id_,msg.id_,"يمه فدوه للحلو🙊")
elseif Text== "منور"  then return sendMsg(msg.chat_id_,msg.id_,"طفي العالي عميتنه😹🐉")
elseif Text== "😒" and not is_sudo then return sendMsg(msg.chat_id_,msg.id_,"اطوني ال45🙊😹")
elseif Text== "مح"  then return sendMsg(msg.chat_id_,msg.id_,"عسل يروحيي 🙊💗")
elseif Text== "شكرا" or Text== "ثكرا" then return  sendMsg(msg.chat_id_,msg.id_,"ولو😹")
elseif Text== "شغل مولده"  then return sendMsg(msg.chat_id_,msg.id_,"بانزين مابيهه ولي جيب واشغلهه ")
elseif Text== "😍"  then return sendMsg(msg.chat_id_,msg.id_,"فرحان ابو زربا ☹️😹")
elseif Text== "اكرهك"  then return sendMsg(msg.chat_id_,msg.id_,"ديدي علساس اني اطيق لشوفتك يلا ولي 😹🏌🏻‍♂️")
elseif Text== "جبت بانزين" then return sendMsg(msg.chat_id_,msg.id_,"تدلل هسه اشغله بس لم من كل عضو الف مال بانزين😹😹")
elseif Text== "ضوجه"  then return sendMsg(msg.chat_id_,msg.id_,"طبك مرض ونيشعلي 😐")
elseif Text== "صاك"  then return sendMsg(msg.chat_id_,msg.id_,"زاحفه 😂 منو هذا دزيلي صورهه")
elseif Text== "شغل ثلاجه"  then return  sendMsg(msg.chat_id_,msg.id_,"شغلتهه ولدزني بعد تريد كوم انته فتهمت😡😹 ")
elseif Text== "شغل المروحه"  then return sendMsg(msg.chat_id_,msg.id_,"😻شغلتهه استادي🙈😻")
elseif Text== "شغل بلازما" then return sendMsg(msg.chat_id_,msg.id_,"تعبت ولرب كوم انته فدوه😹😻😻'")
elseif Text== "رتب الكروب راح يجي خطار" then return sendMsg(msg.chat_id_,msg.id_,"رتبته من الصبح كعدت ب 6😹😹🙈")
elseif Text== "شكو" then return sendMsg(msg.chat_id_,msg.id_," لتدخل بما لا يعنيك😹🐸")
elseif Text== "انته منو" or Text=="منو نته" then return sendMsg(msg.chat_id_,msg.id_,"⚜┊انآ بوت بوت أسمي ["..Bot_Name.."] ✓ ⚜\n👨🏻‍✈️┊آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت\n\n📛┊مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...\n\n⚠️┊ضيفني لكروبك ورفعني مشرف بلكروب وارسل تفعيل داخل الكروب")
elseif Text== "كلخرا" or Text== "اكل خره" then return sendMsg(msg.chat_id_,msg.id_,"حطن نفسكك بصحن وتع حبيبي😹🤹‍♂️")
elseif Text== "😔"  then return sendMsg(msg.chat_id_,msg.id_,"ها منو مات حتا هيج ضايجج 🤣😹")
elseif Text== "☹️"  then return sendMsg(msg.chat_id_,msg.id_,"ها منو مات حتا هيج ضايجج 🤣😹")
elseif Text== "جوعان"  then return sendMsg(msg.chat_id_,msg.id_,"شِٰہٰٰبّہيِٰہڪٰྀہٰٰٖ شِٰہٰٰڪٰྀہٰٰٖد تَہَٰآڪٰྀہٰٰٖوِل وِمٰ̲ہآتَہَٰشِٰہٰٰبّہ؏ۤـہٰٰ😒")
elseif Text== "خاصك"  then return sendMsg(msg.chat_id_,msg.id_,"خوا هاذ زاحف كضوو بنعال😹💗")
elseif Text== "يومه فدوه"  then return sendMsg(msg.chat_id_,msg.id_,"فدؤه الج حياتي 😍😙")
elseif Text== "ملابس"  then return sendMsg(msg.chat_id_,msg.id_,"🌚☝🏿 تريدهن من المول لو من باله ؟")
elseif Text== "احبج"  then return sendMsg(msg.chat_id_,msg.id_,"اويلي حبهها من اول رد شنهاي 🥺🤣")
elseif Text== "مول"  then return sendMsg(msg.chat_id_,msg.id_,"😹☝🏿يريد يقطني ماشتريلك لوتموت")
elseif Text== "باله"  then return sendMsg(msg.chat_id_,msg.id_,"😹☝🏿 موحلوات عليك هم ماشتريل")
elseif Text== "شغل ضوه"  then  return sendMsg(msg.chat_id_,msg.id_,"ميحتاج اشغله هوه انته شمعه "  )
elseif Text== "مرحبا"  then return sendMsg(msg.chat_id_,msg.id_,"  مٌـﮩۚـرحـﮩۘـتين")
elseif Text== "سلام" or Text== "السلام عليكم" or Text== "سلام عليكم" or Text=="سلامن عليكم" or Text=="السلامن عليكم" then 
return sendMsg(msg.chat_id_,msg.id_,"وعليكم السلام ورحمه حته الله😒😹 " )
elseif Text== "عضه"  then return sendMsg(msg.chat_id_,msg.id_,"شكلولك علي جلب؟ انته روح عضه 😕😹" )
elseif Text== "🚶🏻‍♂"  then return sendMsg(msg.chat_id_,msg.id_," مٰ̲ہتَہَٰڪٰྀہٰٰٖليِٰہ شِٰہٰٰ؏ۤـہٰٰنَِٰہٰدڪٰྀہٰٰٖ تَہَٰمٰ̲ہشِٰہٰٰيِٰہ لخٰ̐ہآطر آللھہ 🤔")
elseif Text== "البوت واكف" then return sendMsg(msg.chat_id_,msg.id_," اطردك ؟ 😒")
elseif Text== "ضايج"  then return sendMsg(msg.chat_id_,msg.id_,"ليش ضايج حياتي")
elseif Text== "ضايجه"  then return sendMsg(msg.chat_id_,msg.id_,"منو مضوجج كبدايتي")
elseif Text== "صدك"  then return sendMsg(msg.chat_id_,msg.id_,"قابل اجذب عليك!؟ 🌚")
elseif Text== "بعدك لو بطلت"  then return sendMsg(msg.chat_id_,msg.id_,"بربك اكو واحد يعوف شغله -_-")
elseif Text== "تخليني"  then return sendMsg(msg.chat_id_,msg.id_,"اخليك بزاويه 380 درجه وانته تعرف الباقي 🐸")
elseif Text== "فديتك" or Text== "فديتنك"  then return  sendMsg(msg.chat_id_,msg.id_,"فداكـ/چ ثولان العالـم😍😂" )
elseif Text== "بوت"  then return sendMsg(msg.chat_id_,msg.id_,"حياتي لتكول بوت اسمي؟["..Bot_Name.."] ")
elseif Text== "مساعدة"  then return sendMsg(msg.chat_id_,msg.id_,"لعرض قائمة المساعدة اكتب الاوامر 🌚❤️")
elseif Text== "زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"زاحف عله خالتك الشكره 🌝")
elseif Text== "فتح الفارسيه بالتقيد"  then return sendMsg(msg.chat_id_,msg.id_,"📌┇تم فتح الفارسيه ")
elseif Text== "قفل الفارسيه بالتقيد"  then return sendMsg(msg.chat_id_,msg.id_,"📌┇الفارسيه بالتأكيد تم قفله")
elseif Text== "الدعم"  then return sendMsg(msg.chat_id_,msg.id_,"تم ارسال رساله لمطور 💂")
elseif Text== "حذف صلاحيه العضو"  then return sendMsg(msg.chat_id_,msg.id_,"⌛┇العضو لا يملك صلاحيه")
elseif Text== "فتح همسه"  then return sendMsg(msg.chat_id_,msg.id_,"🔍┇تم فتح همسه ")
elseif Text== "قفل همسه"  then return sendMsg(msg.chat_id_,msg.id_,"🔍┇تم قفل همسه ")
elseif Text== "مشرف"  then return sendMsg(msg.chat_id_,msg.id_,"📡┇تم اضافه صلاحيه مشرف")
elseif Text== "عضو مميز"  then return sendMsg(msg.chat_id_,msg.id_,"🔍┇تم اضافه صلاحيه عضو مميز ")
elseif Text== "مدير"  then return sendMsg(msg.chat_id_,msg.id_,"📮┇تم اضافه صلاحيه مدير ")
elseif Text== "ادمن"  then return sendMsg(msg.chat_id_,msg.id_,"📡┇تم اضافه صلاحيه ادمن")
elseif Text== "اضف صلاحيه"  then return sendMsg(msg.chat_id_,msg.id_,"📮┇ارسل الصلاحيه التي تريد اضافته✓️")
elseif Text== "ورده" or Text== "وردة" then return sendMsg(msg.chat_id_,msg.id_,"أنت  عطرها 🌹🌸")
elseif Text== "شسمك"  then return sendMsg(msg.chat_id_,msg.id_,"🥺┊أسمي ["..Bot_Name.."]\n👨🏻‍✈️┊آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت\n📛┊مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...\n⚠️┊ضيفني لكروبك ورفعني مشرف بلكروب وارسل تفعيل داخل الكروب")
elseif Text== "قفل الفارسيه"  then return sendMsg(msg.chat_id_,msg.id_,"📌┇ تم قفل الفارسيه  ☑️")
elseif Text== "فتح الفارسيه"  then return sendMsg(msg.chat_id_,msg.id_,"⚙┇ تم فتح الفارسيه ☑️")
elseif Text== "م7"  then return sendMsg(msg.chat_id_,msg.id_,"🧙‍♂┇آهــلا بك عزيزي🍃\n📬┇إليـك اوامر التحشيش ⇊ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n💂🏻‍♂️┇اوامر القادة ~> لعرض الاوامر\n🕺🏻┇اوامر الهيبه ~> لعرض الاوامر\n👳🏻‍♂️┇اوامر الدين ~> لعرض الاوامر\n🐴┇اوامر الحيوانات ~> لعرض الاوامر\n ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
elseif Text== "اوامر الحيوانات"  then return sendMsg(msg.chat_id_,msg.id_,"🧙‍♂┇آهــلا بك عزيزي🍃\n📬┇إليـك اوامر التحشيش ⇊ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n🐕┇رفع ↫ تنزيل ↫ جلب\n🐴┇رفع ↫ تنزيل ↫ مطي \n🐐┇رفع ↫ تنزيل ↫ صخل\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
elseif Text== "رفع جلب"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو  جلب 🐶 في المجموعه 😹")
elseif Text== "تنزيل جلب"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬¦ تم تنزيل العضو جلب 🐶 المجموعه 😹")
elseif Text== "رفع مطي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو مطي 🐴 في المجموعه 😹")
elseif Text== "تنزيل مطي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو مطي من المجموعه🐴 ")
elseif Text== "رفع صخل"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو صخل 🐐 في المجموعه 😹")
elseif Text== "تنزيل صخل"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو صخل 🐐 من المجموعه 😹")
elseif Text== "اوامر القادة"  then return sendMsg(msg.chat_id_,msg.id_,"🧙‍♂┇آهــلا بك عزيزي🍃\n📬┇إليـك اوامر القادة ⇊ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n👨🏻‍✈️┇رفع ↫ تنزيل ↫ ملازم\n👨🏻‍🎓┇رفع ↫ تنزيل ↫ عقيد\n👨🏻‍🏭┇رفع ↫ تنزيل ↫ ضابط\n👨🏻‍⚖️┇رفع ↫ تنزيل ↫ شرطي\n👮🏻‍♂️┇رفع ↫ تنزيل ↫ عريف \n👨🏻‍💻┇رفع ↫ تنزيل ↫ نقيب\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
elseif Text== "رفع نقيب"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو نقيب في المجموعه ☑️")
elseif Text== "تنزيل نقيب"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو نقيب في المجموعه ☑️")
elseif Text== "رفع شرطي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو شرطي في المجموعه ☑️")
elseif Text== "تنزيل شرطي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو شرطي في المجموعه ☑️")
elseif Text== "رفع عريف"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو عريف في المجموعه ☑️")
elseif Text== "تنزيل عريف"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو عريف في المجموعه ☑️")
elseif Text== "رفع ضابط"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو ضابط في المجموعه \n✓️")
elseif Text== "تنزيل ضابط"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو ضابط في المجموعه ☑️")
elseif Text== "رفع ملازم"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو ملازم في المجموعه ☑️")
elseif Text== "تنزيل ملازم"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو ملازم في المجموعه ☑️")
elseif Text== "رفع عقيد"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو عقيد في المجموعه ☑️")
elseif Text== "تنزيل عقيد"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو عقيد في المجموعه ☑️")
elseif Text== "اوامر الدين"  then return sendMsg(msg.chat_id_,msg.id_,"🧙‍♂┇آهــلا بك عزيزي🍃\n📌┇إليـك اوامر الدين ⇊ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n🎭┇رفع ↫ تنزيل ↫ شيخ\n👳🏻‍♂️┇رفع ↫ تنزيل ↫ سيد\n🎅🏻┇رفع ↫ تنزيل ↫ مؤمن\n💂🏻‍♂️┇رفع ↫ تنزيل ↫ امام\n🧔🏼┇رفع ↫ تنزيل ↫ نبي \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
elseif Text== "رفع مؤمن"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو مؤمن في المجموعه ☑️")
elseif Text== "تنزيل مؤمن"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو مؤمن في المجموعه ☑️")
elseif Text== "رفع امام"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو امام في المجموعه ☑️")
elseif Text== "تنزيل امام"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو امام في المجموعه ☑️")
elseif Text== "رفع شيخ"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو شيخ في المجموعه ☑️")
elseif Text== "تنزيل شيخ"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو شيخ في المجموعه ☑️")
elseif Text== "رفع سيد"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو سيد في المجموعه ☑️")
elseif Text== "تنزيل سيد"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو سيد في المجموعه ☑️")
elseif Text== "رفع نبي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو نبي في المجموعه ☑️")
elseif Text== "تنزيل نبي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو نبي في المجموعه ☑️")
elseif Text== "اوامر الهيبه"  then return sendMsg(msg.chat_id_,msg.id_,"🧙‍♂┇آهــلا بك عزيزي🍃\n📬┇إليـك اوامر الهيبه ⇊ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n🤴🏻┇رفع ↫ تنزيل ↫ تاج\n🧓🏿┇رفع ↫ تنزيل ↫ حلو\n👶🏻┇رفع ↫ تنزيل ↫ اجكم\n🧟‍♂️┇رفع ↫ تنزيل ↫ اثول \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
elseif Text== "رفع اثول"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو اثول في المجموعه 😹")
elseif Text== "تنزيل اثول"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو اثول من المجموعه 😹")
elseif Text== "رفع زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو زاحف 🐊 في المجموعه 😹")
elseif Text== "تنزيل زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو زاحف 🐊 من المجموعه 😹")
elseif Text== "رفع بكلبي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو في كلبك❤")
elseif Text== "تنزيل من كلبي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو  من 💔 قلبك☹️")
elseif Text== "رفع تاج"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع الضو تاج 👑 في المجموعه 😻")
elseif Text== "تنزيل تاج"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو تاج 👑 من المجموعه ☹️")
elseif Text== "رفع مرتي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم رفع العضو مرتك🙋 في المجموعه 😹")
elseif Text== "تنزيل مرتي"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم تنزيل العضو مرتك🙋 من المجموعه 😹")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم زواج👫 العضو في المجموعه 😹")
elseif Text== "طلاك"  then return sendMsg(msg.chat_id_,msg.id_,"👨🏽‍⚖️️️┇ مرحبا عزيزي🍃 \n📬┇ تم طلاك العضو من المجموعه 😹")

elseif Text== "اقرالي دعاء" then 
return sendMsg(msg.chat_id_,msg.id_,"اللهم عذب المدرسين 😢 منهم الاحياء والاموات 😭🔥 اللهم عذب ام الانكليزي 😭💔 وكهربها بلتيار الرئيسي 😇 اللهم عذب ام الرياضيات وحولها الى غساله بطانيات 🙊 اللهم عذب ام الاسلاميه واجعلها بائعة الشاميه 😭🍃 اللهم عذب ام العربي وحولها الى بائعه البلبي اللهم عذب ام الجغرافيه واجعلها كلدجاجه الحافية اللهم عذب ام التاريخ وزحلقها بقشره من البطيخ وارسلها الى المريخ اللهم عذب ام الاحياء واجعلها كل مومياء اللهم عذب المعاون اقتله بلمدرسه بهاون 😂😂😂")
elseif Text== "ايديي" or Text=="ايدي 🆔" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"📮┇آضـغط على آلآيدي ليتم آلنسـخ\n\n "..USERNAME.." ~⪼ ( "..data.id_.." )",37,USERCAR)  
return false
end)
elseif Text=="اريد رابط الحذف" or Text=="اريد رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
return sendMsg(msg.chat_id_,msg.id_,[[
💭*┇* رابط حذف حـساب التيليگرام ↯
♦️┇لتتندم فڪر قبل ڪلشي  
🚸┇[اضغط هنا لـحـذف الـحـسـاب](https://telegram.org/deactivate)
👨🏽‍⚖️┇بالتـوفيـق عزيزي ...
🎁┇[اضغط هنا لديك مفاجئه](https://t.me/cgngv)
]] )
--=====================================
elseif Text== "انجب" or Text== "نجب" or Text=="جب" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"تہٰٰٖدلًُل مہٰٰطہٰٰٖوريہٰٰٖ  انـہٰٰجبہيًَِْہٰت 🌝🎋  ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"حۣۗـۙبۣۗـۙيۣۗہبۣۗـۙيۣۗ آلَمۣۗـۙنۣۗـۙشۣۗـۙئ بۣۗـۙلَخۣۗـۙدُمۣۗـۙهۣۗہ تۣۗـۙدُلَلَ آنۣۗـۙتۣۗـۙآ 😔💗")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"بہيہكہ بہخہت مہديہر جہآن سہحہلتہكہ سہحہل 😒💗")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"تّرأّ أّنِزِّلَګ هِأّ لَأّتّنِدِګ بَِّسأّيِّدِګ🏌🏿‍♂️😹")
else 
return sendMsg(msg.chat_id_,msg.id_,"أّهِفِّګ بِلَ 45تّجِرأَّّسګ أّلَبِوِتّ َّسلَطّهِ مَنِ بِعٌدِ أّلَلَهِ😹🐉")
end 
end 




end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------

if redis:get(brothers..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(brothers..'ExpireDate:'..msg.chat_id_)
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'🕵🏼️‍♀️┇انتهى الاشتراك في احد المجموعات ✋🏿\n👨🏾‍🔧┇المجموعه : '..FlterName(redis:get(brothers..'group:name'..msg.chat_id_))..'🍃\n💂🏻‍♀️┇ايدي : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'🕵🏼️‍♀️┇انتهى الاشتراك البوت✋🏿\n💂🏻‍♀️┇سوف اغادر المجموعه فرصه سعيده 👋🏿\n👨🏾‍🔧┇او راسل المطور للتجديد '..SUDO_USER..' 🍃')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(brothers..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'🕵🏼️‍♀️┇باقي يوم واحد وينتهي الاشتراك ✋🏿\n👨🏾‍🔧┇راسل المطور للتجديد '..SUDO_USER..'\n📛')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------


end 


return {
brothers = {
"^(تقييد)$",
"^(تقييد) (%d+)$",
"^(تقييد) (@[%a%d_]+)$",
"^(الغاء تقييد)$",
"^(الغاء تقييد) (%d+)$",
"^(الغاء تقيبد) (@[%a%d_]+)$",
"^(فك تقييد)$",
"^(فك تقييد) (%d+)$",
"^(فك تقييد) (@[%a%d_]+)$",
"^(ضع شرط التفعيل) (%d+)$",
"^(التفاعل)$",
"^(التفاعل) (@[%a%d_]+)$",
"^([iI][dD])$",
"^(تفعيل الايدي بالصوره)$",
"^(تعطيل الايدي بالصوره)$",
"^(تعطيل الرفع)$",
"^(تفعيل الرفع)$",
"^(قفل الدخول)$",
"^(فتح الدخول)$", 
"^(ايدي)$",
"^(ايدي) (@[%a%d_]+)$",
"^(ايدي العضو)$",
"^(ايدي العضو) (%d+)$",
"^(ايدي العضو) (@[%a%d_]+)$",
'^(اضف مميز)$',
'^(اضف مميز) (@[%a%d_]+)$',
'^(اضف مميز) (%d+)$',
'^(تنزيل مميز)$',
'^(تنزيل مميز) (@[%a%d_]+)$',
'^(تنزيل مميز) (%d+)$',
'^(اضف ادمن)$',
'^(اضف ادمن) (@[%a%d_]+)$',
'^(اضف ادمن) (%d+)$',
'^(تنزيل ادمن)$',
'^(تنزيل ادمن) (@[%a%d_]+)$',
'^(تنزيل ادمن) (%d+)$', 
'^(اضف المدير)$',
'^(اضف مدير)$', 
'^(اضف مدير) (@[%a%d_]+)$',
'^(اضف المدير) (@[%a%d_]+)$',
'^(اضف المدير) (%d+)$',
'^(اضف مدير) (%d+)$',
'^(اضف منشى اساسي)$',
'^(اضف منشئ اساسي)$',
'^(اضف منشئ اساسي) (@[%a%d_]+)$',
'^(اضف منشى اساسي) (@[%a%d_]+)$',
'^(تنزيل منشئ اساسي)$',
'^(تنزيل منشى اساسي)$',
'^(تنزيل منشئ اساسي) (%d+)$',
'^(تنزيل منشى اساسي) (%d+)$',
'^(تنزيل منشى اساسي) (@[%a%d_]+)$',
'^(تنزيل منشئ اساسي) (@[%a%d_]+)$',
'^(اضف منشى)$',
'^(اضف منشئ)$',
'^(اضف منشئ) (@[%a%d_]+)$',
'^(اضف منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ)$',
'^(تنزيل منشى)$',
'^(تنزيل منشئ) (%d+)$',
'^(تنزيل منشى) (%d+)$',
'^(تنزيل منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ) (@[%a%d_]+)$',
'^(تنزيل المدير)$',
'^(تنزيل مدير)$',
'^(تنزيل مدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (%d+)$',
'^(تنزيل مدير) (%d+)$',
 '^(صلاحياته)$',
 '^(صلاحياتي)$',
'^(صلاحياته) (@[%a%d_]+)$',
'^(قفل) (.+)$',
'^(فتح) (.+)$',
'^(تفعيل)$',
'^(تفعيل) (.+)$',
'^(تعطيل)$',
'^(تعطيل) (.+)$',
'^(ضع تكرار) (%d+)$',
"^(مسح)$",
"^(مسح) (.+)$",
'^(منع) (.+)$',
'^(الغاء منع) (.+)$',
"^(حظر عام)$",
"^(حظر عام) (@[%a%d_]+)$",
"^(حظر عام) (%d+)$",
"^(الغاء العام)$",
"^(الغاء العام) (@[%a%d_]+)$",
"^(الغاء العام) (%d+)$",
"^(الغاء عام)$",
"^(الغاء عام) (@[%a%d_]+)$",
"^(الغاء عام) (%d+)$",
"^(حظر)$",
"^(حظر) (@[%a%d_]+)$",
"^(حظر) (%d+)$",
"^(الغاء الحظر)$", 
"^(الغاء الحظر) (@[%a%d_]+)$",
"^(الغاء الحظر) (%d+)$",
"^(الغاء حظر)$", 
"^(الغاء حظر) (@[%a%d_]+)$",
"^(الغاء حظر) (%d+)$",
"^(طرد)$",
"^(طرد) (@[%a%d_]+)$",
"^(طرد) (%d+)$",
"^(كتم)$",
"^(كتم) (@[%a%d_]+)$",
"^(كتم) (%d+)$",
"^(الغاء الكتم)$",
"^(الغاء الكتم) (@[%a%d_]+)$",
"^(الغاء الكتم) (%d+)$",
"^(الغاء كتم)$",
"^(الغاء كتم) (@[%a%d_]+)$",
"^(الغاء كتم) (%d+)$",
"^(اضف مطور)$",
"^(اضف مطور) (@[%a%d_]+)$",
"^(اضف مطور) (%d+)$",
"^(تنزيل مطور)$",
"^(تنزيل مطور) (%d+)$",
"^(تنزيل مطور) (@[%a%d_]+)$",
"^(تعطيل) (-%d+)$",
"^(الاشتراك) ([123])$",
"^(الاشتراك)$",
"^(تنزيل الكل)$", 
"^(شحن) (%d+)$",
"^(المجموعه)$",
"^(كشف البوت)$",
"^(انشاء رابط)$",
"^(ضع الرابط)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الغاء تثبيت)$",
"^(رابط)$",
"^(الرابط)$",
"^(ضع رابط)$",
"^(رابط خاص)$",
"^(الرابط خاص)$",
"^(القوانين)$",
"^(ضع القوانين)$",
"^(ضع قوانين)$",
"^(ضع تكرار)$",
"^(ضع التكرار)$",
"^(الادمنيه)$",
"^(تاك للكل)$",
"^(قائمه المنع)$",
"^(المنشئيين)$",
"^(المدراء)$",
"^(المميزين)$",
"^(المكتومين)$",
"^(ضع الترحيب)$",
"^(الترحيب)$",
"^(المحظورين)$",
"^(ضع اسم)$",
"^(ضع صوره)$",
"^(ضع وصف)$",
"^(طرد البوتات)$",
"^(كشف البوتات)$",
"^(طرد المحذوفين)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(احصائياتي)$",
"^(معلوماتي)$",
"^(مسح معلوماتي)$",
"^(موقعي)$",
"^(رفع الادمنيه)$",
"^(صوره الترحيب)$",
"^(ضع كليشه المطور)$",
"^(المطور)$",
"^(شرط التفعيل)$",
"^(قائمه المجموعات)$",
"^(المجموعات)$",
"^(المجموعات ⌛)$",
"^(المشتركين)$",
"^(المشتركين 📌)$",
"^(اذاعه)$",
"^(اذاعه عام)$",
"^(اذاعه خاص)$",
"^(اذاعه عام بالتوجيه)$",
"^(اذاعه عام بالتوجيه 📻)$", 
"^(اذاعه خاص 🗃️)$", 
"^(اذاعه عام 📢)$", 
"^(اذاعه 📣)$", 
"^(قائمه العام)$",
"^(قائمه العام 🚫)$",
"^(المطورين)$",
"^(المطورين 👷)$",
"^(تيست)$",
"^(test)$",
"^(ايديي📌)$",
"^(قناة السورس 📡)$",
"^(الاحصائيات)$",
"^(الاحصائيات 📊)$",
"^(اضف رد عام)$",
"^(اضف رد عام 📯)$",
"^(مسح الردود)$",
"^(مسح الردود العامه)$",
"^(ضع اسم للبوت)$",
"^(مسح الصوره)$",
"^(مسح رد)$",
"^(الردود)$",
"^(الردود العامه)$",
"^(الردود العامه 📮)$",
"^(اضف رد)$",
"^(/UpdateSource)$",
"^(تحديث السورس ™)$",
"^(تحديث السورس)$",
"^(تنظيف المجموعات)$",
"^(تنظيف المشتركين)$",
"^(تنظيف المجموعات 📊)$",
"^(تنظيف المشتركين 📤)$",
"^(رتبتي)$",
"^(ضع اسم للبوت ©)$",
"^(ضع صوره للترحيب 🏞️)$",
"^(ضع صوره للترحيب)$",
"^(الحمايه)$",
"^(الاعدادات)$",
"^(الوسائط)$",
"^(الغاء الامر ✖️)$",
"^(الرتبه)$",
"^(الغاء)$",
"^(الساعه)$",
"^(سحكاتي)$",
"^(اسمي)$",
"^(التاريخ)$",
"^(/[Ss]tore)$",
"^(اصدار السورس)$",
"^(الاصدار)$",
"^(server)$",
"^(السيرفر)$",
"^(فحص البوت)$", 
"^(جلب الكروبات)$",
"^(رفع الكروبات)$", 
"^(تفعيل الاشتراك الاجباري)$", 
"^(تعطيل الاشتراك الاجباري)$", 
"^(تغيير الاشتراك الاجباري)$", 
"^(الاشتراك الاجباري)$", 
"^(تفعيل الاشتراك الاجباري ☑️)$", 
"^(تعطيل الاشتراك الاجباري ♻️)$", 
"^(تغيير الاشتراك الاجباري 🚫)$", 
"^(الاشتراك الاجباري 🏌🏿‍♂️)$", 
"^(احظرني)$", 
"^(اطردني)$", 
"^(جهاتي)$", 

"^(الغاء)$", 
"^(مسح تعيين الايدي)$", 
"^(مسح الايدي)$", 
"^(تعين الايدي)$", 









"^(السورس)$",
"^(سورس)$",
"^(م5)$", 
"^(م6)$",
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$",
"^(م4)$",


 
 
 },
 ibrothers = ibrothers,
 dbrothers = dbrothers,
 }
