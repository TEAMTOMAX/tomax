--[[
▇▇▇▇ @sajad14p ▇▇▇            ▇▇▇▇▇▇▇
▇           ▇           ▇            ▇                    ▇
▇           ▇           ▇            ▇                    ▇
▇           ▇           ▇            ▇                    ▇
▇▇▇▇              ▇            ▇       تم برمجه وتطوير من قبل ابو جود             ▇
▇           ▇           ▇            ▇                    ▇
▇           ▇           ▇            ▇ ¦ @cgngv  ▇
▇           ▇           ▇            ▇                    ▇ ¦Dev :@sajad14p
▇▇▇▇ @sajad14p ▇▇▇                        ▇ ¦Source brothers BY @sajad14p
---------------------------------------------------------------------
]]
---------------Lock ------------------- 
function unlock_waring(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..'lock_woring'..msg.chat_id_) then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.." \n📌*┇*التحذير مفعل مسبقاً ☑️" 
else redis:set(brothers..'lock_woring'..msg.chat_id_,true)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تــم تفعيل التحذير ☑️" 
end
end
 
function lock_waring(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'lock_woring'..msg.chat_id_) then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*التحذير بالتأكيد معطل ☑️" 
else
redis:del(brothers..'lock_woring'..msg.chat_id_) 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تــــم تعطيل التحذير ☑️" 
end 
end

function lock_ID(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'lock_id'..msg.chat_id_) then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*الايدي بالتأكيد معطل ☑️" 
else
redis:del(brothers..'lock_id'..msg.chat_id_) 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تــم تعطيل امر الايدي ☑️" 
end 
end

function unlock_ID(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..'lock_id'..msg.chat_id_) then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*امر الايدي شغال بالفعل ☑️" 
else 
redis:set(brothers..'lock_id'..msg.chat_id_,true)  
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تــــم تفعيل امر الايدي ☑️" 
end 
end

function unlock_Welcome(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..'welcome:get'..msg.chat_id_) then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تفعيل الترحيب مفعل مسبقاً ☑️" 
else redis:set(brothers..'welcome:get'..msg.chat_id_,true)  
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تــــم تفعيل الترحيب ☑️" 
end 
end

function lock_Welcome(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {الادمن,المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'welcome:get'..msg.chat_id_) then 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*الترحيب بالتأكيد معطل ☑️" 
else
redis:del(brothers..'welcome:get'..msg.chat_id_) 
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تــــم تعطيل الترحيب ☑️" 
end 
end

function lock_All(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
redis:mset(
brothers..'lock_username'..msg.chat_id_,true,
brothers..'mute_gif'..msg.chat_id_,true,
brothers..'mute_photo'..msg.chat_id_,true,
brothers..'mute_audio'..msg.chat_id_,true,
brothers..'mute_voice'..msg.chat_id_,true,
brothers..'mute_sticker'..msg.chat_id_,true,
brothers..'mute_forward'..msg.chat_id_,true,
brothers..'mute_contact'..msg.chat_id_,true,
brothers..'mute_location'..msg.chat_id_,true,
brothers..'mute_document'..msg.chat_id_,true,
brothers..'lock_link'..msg.chat_id_,true,
brothers..'lock_tag'..msg.chat_id_,true,
brothers..'lock_edit'..msg.chat_id_,true,
brothers..'lock_spam'..msg.chat_id_,true,
brothers..'lock_bots'..msg.chat_id_,true,
brothers..'lock_webpage'..msg.chat_id_,true,
brothers..'mute_video'..msg.chat_id_,true,
brothers..'mute_inline'..msg.chat_id_,true
)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تــــم قفل الكل  ☑️"
end

function Unlock_All(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
redis:del(
brothers..'lock_username'..msg.chat_id_,
brothers..'mute_gif'..msg.chat_id_,
brothers..'mute_photo'..msg.chat_id_,
brothers..'mute_audio'..msg.chat_id_,
brothers..'mute_voice'..msg.chat_id_,
brothers..'mute_sticker'..msg.chat_id_,
brothers..'mute_forward'..msg.chat_id_,
brothers..'mute_contact'..msg.chat_id_,
brothers..'mute_location'..msg.chat_id_,
brothers..'mute_document'..msg.chat_id_,
brothers..'lock_link'..msg.chat_id_,
brothers..'lock_tag'..msg.chat_id_,
brothers..'lock_edit'..msg.chat_id_,
brothers..'lock_spam'..msg.chat_id_,
brothers..'lock_bots'..msg.chat_id_,
brothers..'lock_webpage'..msg.chat_id_,
brothers..'mute_video'..msg.chat_id_,
brothers..':tqeed_video:'..msg.chat_id_,
brothers..':tqeed_photo:'..msg.chat_id_,
brothers..':tqeed_gif:'..msg.chat_id_,
brothers..':tqeed_fwd:'..msg.chat_id_,
brothers..':tqeed_link:'..msg.chat_id_,
brothers..'mute_inline'..msg.chat_id_
)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌*┇*تــــم فتح الكل  ☑️"
end

function lock_Media(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
redis:mset(
brothers..'mute_gif'..msg.chat_id_,true,
brothers..'mute_photo'..msg.chat_id_,true,
brothers..'mute_audio'..msg.chat_id_,true,
brothers..'mute_voice'..msg.chat_id_,true,
brothers..'mute_sticker'..msg.chat_id_,true,
brothers..'mute_video'..msg.chat_id_,true
)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌¦ تــــم قفل الوسائط  ☑️"
end

function Unlock_Media(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
redis:del(
brothers..'mute_gif'..msg.chat_id_,
brothers..'mute_photo'..msg.chat_id_,
brothers..'mute_audio'..msg.chat_id_,
brothers..'mute_voice'..msg.chat_id_,
brothers..'mute_sticker'..msg.chat_id_,
brothers..'mute_video'..msg.chat_id_
)
return "📮*┇*أهلا عزيزي "..msg.TheRankCmd.."\n📌¦ تــــم فتح الوسائط  ☑️"
end

function tqeed_photo(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..':tqeed_photo:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌┇*الصور بالتقيد بالتأكيد تــــم قفله ☑️'
else
redis:del(brothers..'mute_photo'..msg.chat_id_)
redis:set(brothers..':tqeed_photo:'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الصور بالتقييد  ☑️'
end
end

function fktqeed_photo(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..':tqeed_photo:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الصور بالتقيد بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..':tqeed_photo:'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الصور بالتقييد ☑️'
end
end

---------------Lock -------------------
function tqeed_video(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..':tqeed_video:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الفيديو بالتقيد بالتأكيد تــــم قفله ☑️'
else
redis:del(brothers..':tqeed_video:'..msg.chat_id_)
redis:set(brothers..':tqeed_video:'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الفيديو بالتقييد  ☑️'
end
end

function fktqeed_video(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..':tqeed_video:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الفيديو بالتقيد بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..':tqeed_video:'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الفيديو بالتقييد ☑️'
end
end

---------------Lock -------------------
function tqeed_gif(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..':tqeed_gif:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*المتحركه بالتقيد بالتأكيد تــــم قفله ☑️'
else
redis:del(brothers..'mute_gif'..msg.chat_id_)
redis:set(brothers..':tqeed_gif:'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل المتحركه بالتقييد  ☑️'
end
end

function fktqeed_gif(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..':tqeed_gif:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*المتحركه بالتقيد بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..':tqeed_gif:'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح المتحركه بالتقييد ☑️'
end
end

---------------Lock -------------------
function tqeed_fwd(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..':tqeed_fwd:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التوجيه بالتقيد بالتأكيد تــــم قفله ☑️'
else
redis:del(brothers..'mute_forward'..msg.chat_id_)
redis:set(brothers..':tqeed_fwd:'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل التوجيه بالتقييد  ☑️'
end
end

function fktqeed_fwd(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..':tqeed_fwd:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التوجيه بالتقيد بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..':tqeed_fwd:'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح التوجيه بالتقييد ☑️'
end
end
 
---------------Lock -------------------
function tqeed_link(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..':tqeed_link:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الروابط بالتقيد بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..':tqeed_link:'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الروابط بالتقييد  ☑️'
end
end

function fktqeed_link(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..':tqeed_link:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الروابط بالتقيد بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..':tqeed_link:'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الروابط بالتقييد ☑️'
end
end

---------------Lock -------------------
function tqeed_photo(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..':tqeed_photo:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الصور بالتقيد بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..':tqeed_photo:'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الصور بالتقييد  ☑️'
end
end

function fktqeed_photo(msg)
if not msg.Director then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..':tqeed_photo:'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الصور بالتقيد بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..':tqeed_photo:'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الصور بالتقييد ☑️'
end
end
---------------Lock twasel-------------------
function lock_twasel(msg)
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
if redis:get(brothers..'lock_twasel') then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التواصل بالتاكيد تــــم تعطيله ☑️'
else
redis:set(brothers..'lock_twasel',true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم تعطيل التواصل  ☑️'
end
end

function unlock_twasel(msg)
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
if not redis:get(brothers..'lock_twasel') then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التواصل بالتاكيد تــــم تفعيله ☑️'
else 
redis:del(brothers..'lock_twasel')
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم تفعيل التواصل ☑️'
end
end

---------------Lock bro-------------------
function lock_brod(msg)
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if not redis:get(brothers..'lock_brod') then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*اذاعه المطورين بالتاكيد تــــم تعطيله ☑️'
else
redis:del(brothers..'lock_brod')
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم تعطيل اذاعه المطورين  ☑️'
end
end
function unlock_brod(msg)
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور فـقـط" end
if redis:get(brothers..'lock_brod') then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*اذاعه المطورين بالتاكيد تــــم تفعيله ☑️'
else 
redis:set(brothers..'lock_brod',true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم تفعيل اذاعه المطورين  ☑️'
end
end

---------------Lock replay-------------------
function lock_replay(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط " end
if not redis:get(brothers..'replay'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الردود بالتاكيد تــــم تعطيله ☑️'
else
redis:del(brothers..'replay'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم تعطيل الردود  ☑️'
end
end

function unlock_replay(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'replay'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الردود بالتاكيد تــــم تفعيله ☑️'
else 
redis:set(brothers..'replay'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم تفعيل الردود  ☑️'
end
end

---------------Lock bot service-------------------
function lock_service(msg)
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
if not redis:get(brothers..'lock_service') then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم بالتاكيد تعطيل نظام البوت خدمي ☑️'
else
redis:del(brothers..'lock_service')
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم  تعطيل نظام البوت خدمي ☑️'
end
end

function unlock_service(msg)
if not msg.SudoBase then return "👨🏻‍💻*┇* لـلـمـطـور الاسـاسـي فـقـط" end
if redis:get(brothers..'lock_service') then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم بالتأكيد تفعيل نظام البوت خدمي ☑️'
else 
redis:set(brothers..'lock_service',true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم تفعيل نظام البوت خدمي ☑️\n🚸¦ اصبح البوت الان بامكان اي شخص\n🔚¦ ان يستخدم البوت للتفعيل'
end
end

---------------Lock Link-------------------
function lock_link(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_link'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الروابط بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'lock_link'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الروابط ☑️'
end
end

function unlock_link(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_link'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الروابط بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'lock_link'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الروابط ☑️'
end
end

---------------Lock Tag-------------------
function lock_tag(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_tag'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التاك بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'lock_tag'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل التاك ☑️'
end
end

function unlock_tag(msg)

if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط " end
if not redis:get(brothers..'lock_tag'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التاك بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'lock_tag'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح التاك ☑️'
end
end
---------------Lock UserName-------------------
function lock_username(msg) 

if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط " end

if redis:get(brothers..'lock_username'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*المعرفات بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'lock_username'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل المعرفات  ☑️'
end
end

function unlock_username(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط " end
if not redis:get(brothers..'lock_username'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*آلمـعرفآت بآلتآگيد تــــم فتحهآ ☑️'
else 
redis:del(brothers..'lock_username'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح آلمـعرفآت ☑️'
end
end

---------------Lock Edit-------------------
function lock_edit(msg) 
if not msg.Admin then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if redis:get(brothers..'lock_edit'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الـمـيـديـا بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'lock_edit'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الـمـيـديـا ☑️'
end
end

function unlock_edit(msg)
if not msg.Admin then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if not redis:get(brothers..'lock_edit'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الـمـيـديـا بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'lock_edit'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الـمـيـديـا ☑️'
end
end

---------------Lock spam-------------------
function lock_spam(msg) 
if not msg.Admin then return "👨🏻‍💻*¦* {المدير,المنشئ,المطور} فقط" end
if   redis:get(brothers..'lock_spam'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الكلايش بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'lock_spam'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الكلايش ☑️'
end
end

function unlock_spam(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_spam'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الكلايش بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'lock_spam'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الكلايش ☑️'
end
end

---------------Lock Flood-------------------
function lock_flood(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_flood'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التكرار بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'lock_flood'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل التكرار ☑️'
end
end

function unlock_flood(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_flood'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التكرار بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'lock_flood'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح التكرار ☑️'
end
end

---------------Lock Bots-------------------
function lock_bots(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_bots'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*البوتات بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'lock_bots'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل البوتات ☑️'
end
end

function unlock_bots(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_bots'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*البوتات بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'lock_bots_by_kick'..msg.chat_id_)
redis:del(brothers..'lock_bots'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح البوتات ☑️'
end
end

---------------Lock Join-------------------
function lock_join(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_join'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الاضافه بالتاكيد تــــم قفلها ☑️'
else
redis:set(brothers..'lock_join'..msg.chat_id_,true)
return '📮خ*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الاضافه ☑️'
end
end

function unlock_join(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_join'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الاضافه بالتاكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'lock_join'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الاضافه ☑️'
end
end

---------------Lock Markdown-------------------
function lock_markdown(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_markdown'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الماركدوان بالتاكيد تــــم قفله ☑️'
else
redis:set(brothers..'lock_markdown'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الماركدوان ☑️'
end
end

function unlock_markdown(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_markdown'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الماركدوان بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'lock_markdown'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الماركدوان ☑️'
end
end

---------------Lock Webpage-------------------
function lock_webpage(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_webpage'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الويب بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'lock_webpage'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الويب ☑️'
end
end

function unlock_webpage(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_webpage'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الويب بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'lock_webpage'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الويب ☑️'
end
end
---------------Mute Gif-------------------
function mute_gif(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_gif'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*المتحركه بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_gif'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل المتحركه ☑️'
end
end

function unmute_gif(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_gif'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*المتحركه بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_gif'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح المتحركه ☑️'
end
end
---------------Mute Game-------------------
function mute_game(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_game'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الالعاب بالتأكيد تــــم قفلها ☑️'
else
redis:set('mute_game'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الالعاب ☑️'
end
end

function unmute_game(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_game'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الألعاب بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_game'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الألعاب ☑️'
end
end
---------------Mute Inline-------------------
function mute_inline(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_inline'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الانلاين بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'mute_inline'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الانلاين ☑️'
end
end

function unmute_inline(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_inline'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الانلاين بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'mute_inline'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الانلاين ☑️'
end
end
---------------Mute Text-------------------
function mute_text(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_text'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الدرشه بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_text'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الدردشه ☑️'
end
end

function unmute_text(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_text'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الدردشه بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_text'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الدردشه ☑️'
end
end
---------------Mute photo-------------------
function mute_photo(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_photo'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الصور بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_photo'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الصور ☑️'
end
end

function unmute_photo(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_photo'..msg.chat_id_)then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الصور بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_photo'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الصور ☑️'
end
end
---------------Mute Video-------------------
function mute_video(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_video'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الفيديو بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_video'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الفيديو ☑️'
end
end

function unmute_video(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_video'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الفيديو بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_video'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الفيديو ☑️'
end
end
---------------Mute Audio-------------------
function mute_audio(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_audio'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*البصمات بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_audio'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل البصمات ☑️'
end
end

function unmute_audio(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_audio'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*البصمات بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_audio'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح البصمات ☑️'
end
end
---------------Mute Voice-------------------
function mute_voice(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if   redis:get(brothers..'mute_voice'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الصوت بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'mute_voice'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الصوت ☑️'
end
end

function unmute_voice(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_voice'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الصوت بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'mute_voice'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الصوت ☑️'
end
end
---------------Mute Sticker-------------------
function mute_sticker(msg) 

if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end

if   redis:get(brothers..'mute_sticker'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الملصقات بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_sticker'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الملصقات ☑️'
end
end

function unmute_sticker(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_sticker'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الملصقات بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_sticker'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الملصقات ☑️'
end
end
---------------Mute Contact-------------------
function mute_contact(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_contact'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*جهات الاتصال بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_contact'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل جهات الاتصال ☑️'
end
end

function unmute_contact(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_contact'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*جهات الاتصال بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_contact'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح جهات الاتصال ☑️'
end
end
---------------Mute Forward-------------------
function mute_forward(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_forward'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التوجيه بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_forward'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل التوجيه ☑️'
end
end

function unmute_forward(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_forward'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التوجيه بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_forward'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح التوجيه ☑️'
end
end
---------------Mute Location-------------------
function mute_location(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_location'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الموقع بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'mute_location'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الموقع ☑️'
end
end

function unmute_location(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_location'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الموقع بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'mute_location'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الموقع ☑️'
end
end
---------------Mute Document-------------------
function mute_document(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_document'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الملفات بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_document'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الملفات ☑️'
end
end

function unmute_document(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_document'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الملفات بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_document'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الملفات ☑️'
end
end
---------------Mute TgService-------------------
function mute_tgservice(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_tgservice'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الاشعارات بالتأكيد تــــم قفلها ☑️'
else
redis:set(brothers..'mute_tgservice'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الاشعارات ☑️'
end
end

function unmute_tgservice(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_tgservice'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الاشعارات بالتأكيد تــــم فتحها ☑️'
else 
redis:del(brothers..'mute_tgservice'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الاشعارات ☑️'
end
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg) 
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'mute_keyboard'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الكيبورد بالتأكيد تــــم قفله ☑️'
else
redis:set(brothers..'mute_keyboard'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل الكيبورد ☑️'
end
end

function unmute_keyboard(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'mute_keyboard'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*الكيبورد بالتأكيد تــــم فتحه ☑️'
else 
redis:del(brothers..'mute_keyboard'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح الكيبورد ☑️'
end
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_bots_by_kick'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*البوتات بالطرد بالتاكيد تــــم قفله ☑️'
else
redis:set(brothers..'lock_bots'..msg.chat_id_,true)
redis:set(brothers..'lock_bots_by_kick'..msg.chat_id_,true)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم قفل البوتات بالطرد  ☑️'
end
end

function unlock_bots_by_kick(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_bots_by_kick'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*البوتات بالطرد بالتاكيد مفتوحه ☑️'
else 
redis:del(brothers..'lock_bots_by_kick'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تــــم فتح البوتات بالطرد  ☑️'
end
end
---------------locks pin-------------------
function lock_pin(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if redis:get(brothers..'lock_pin'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التثبيت بالفعل مقفل ☑️'
else
redis:set(brothers..'lock_pin'..msg.chat_id_,true) 
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تـم قفل التثبيت ☑️'
end
end

function unlock_pin(msg)
if not msg.Admin then return "👨🏻‍💻*┇*هذا الامر يخص الادمنيه فقط  " end
if not redis:get(brothers..'lock_pin'..msg.chat_id_) then
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*التثبيت بالفعل مفتوح ☑️'
else 
redis:del(brothers..'lock_pin'..msg.chat_id_)
return '📮*┇*أهلا عزيزي '..msg.TheRankCmd..'\n📌*┇*تـم فتح التثبيت   ☑️'
end
end
function Flterzhrfa(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,'ﭛ','ي')	
Name = utf8.gsub(Name,'ﺥ','خ')	
Name = utf8.gsub(Name,'ڽ','ن')	
Name = utf8.gsub(Name,'ٽ','ث')	
Name = utf8.gsub(Name,'ڜ','ش')	
Name = utf8.gsub(Name,'ﺵ','ش')	
Name = utf8.gsub(Name,'ﭒ','ي')	
Name = utf8.gsub(Name,'ﮛ','ك')	
Name = utf8.gsub(Name,'ﻡ','م')	
Name = utf8.gsub(Name,'ټ','ت')	
Name = utf8.gsub(Name,'ڼ','ن')	
Name = utf8.gsub(Name,'ﺻ','ص')	
Name = utf8.gsub(Name,'ڝ','ص')	
Name = utf8.gsub(Name,'ﻢ','م')	
Name = utf8.gsub(Name,'ﮑ','ك')	
Name = utf8.gsub(Name,'ﺮ','ر')	
Name = utf8.gsub(Name,'ﺳ','س')	
Name = utf8.gsub(Name,'ٿ','ت')	
Name = utf8.gsub(Name,'ﺦ','خ')	
Name = utf8.gsub(Name,'ڞ','ض')	
Name = utf8.gsub(Name,'ﺢ','ح')	
Name = utf8.gsub(Name,'Ξ','')	
Name = utf8.gsub(Name,'ﺶ','ش')	
Name = utf8.gsub(Name,'ﻠ','ا')	
Name = utf8.gsub(Name,'ﻤ','م')	
Name = utf8.gsub(Name,'ﺾ','ض')	
Name = utf8.gsub(Name,'ﺺ','ص')	
Name = utf8.gsub(Name,'ھ','ه')	
Name = utf8.gsub(Name,'۾','م')	
Name = utf8.gsub(Name,'ﺴ','س')	
Name = utf8.gsub(Name,'ﺿ','ض')	
Name = utf8.gsub(Name,'ڟ','ظ')	
Name = utf8.gsub(Name,'ﻧ','ن')	
Name = utf8.gsub(Name,'ﺤ','ح')	
Name = utf8.gsub(Name,'ﺠ','ج')	
Name = utf8.gsub(Name,'ﺷ','ش')	
Name = utf8.gsub(Name,'ﭴ','ج')	
Name = utf8.gsub(Name,'ژ','ز')	
Name = utf8.gsub(Name,'ٹ','ت')	
Name = utf8.gsub(Name,'ع','ع')	
Name = utf8.gsub(Name,'ﺧ','خ')	
Name = utf8.gsub(Name,'ﺯ','ز')	
Name = utf8.gsub(Name,'ڙ','ز')	
Name = utf8.gsub(Name,'ﻦ','ن')	
Name = utf8.gsub(Name,'ٸ','ئ')	
Name = utf8.gsub(Name,'ﮂ','د')	
Name = utf8.gsub(Name,'ﮃ','د')	
Name = utf8.gsub(Name,'ﭵ','ج')	
Name = utf8.gsub(Name,'ڻ','ن')	
Name = utf8.gsub(Name,'ښ','س')	
Name = utf8.gsub(Name,'ٻ','ب')	
Name = utf8.gsub(Name,'ﯙ','و')	
Name = utf8.gsub(Name,'ﮫ','ه')	
Name = utf8.gsub(Name,'ﺸ','ش')	
Name = utf8.gsub(Name,'ﺹ','ص')	
Name = utf8.gsub(Name,'ں','ر')	
Name = utf8.gsub(Name,'ﻥ','ن')	
Name = utf8.gsub(Name,'ڛ','س')	
Name = utf8.gsub(Name,'غ','غ')	
Name = utf8.gsub(Name,'ٺ','ت')	
Name = utf8.gsub(Name,'ﭶ','ج')	
Name = utf8.gsub(Name,'ﭨ','')	
Name = utf8.gsub(Name,'ﻖ','ق')	
Name = utf8.gsub(Name,'ۄ','و')	
Name = utf8.gsub(Name,'ڄ','ج')	
Name = utf8.gsub(Name,'ڥ','ف')	
Name = utf8.gsub(Name,'ﮄ','ذ')	
Name = utf8.gsub(Name,'ﮅ','ذ')	
Name = utf8.gsub(Name,'ﮁ','ج')	
Name = utf8.gsub(Name,'ۅ','و')	
Name = utf8.gsub(Name,'څ','ج')	
Name = utf8.gsub(Name,'ﮋ','ز')	
Name = utf8.gsub(Name,'ﺟ','ج')	
Name = utf8.gsub(Name,'ﻣ','م')	
Name = utf8.gsub(Name,'ﻲ','ي')	
Name = utf8.gsub(Name,'ۆ','و')	
Name = utf8.gsub(Name,'ن','ن')	
Name = utf8.gsub(Name,'چ','خ')	
Name = utf8.gsub(Name,'ا','ا')	
Name = utf8.gsub(Name,'ﻟ','ل')	
Name = utf8.gsub(Name,'ﺣ','ح')	
Name = utf8.gsub(Name,'ﺲ','س')	
Name = utf8.gsub(Name,'ۇ','و')	
Name = utf8.gsub(Name,'ڇ','ج')	
Name = utf8.gsub(Name,'ﺰ','ز')	
Name = utf8.gsub(Name,'ﭪ','ف')	
Name = utf8.gsub(Name,'ڦ','ق')	
Name = utf8.gsub(Name,'ﭩ','')	
Name = utf8.gsub(Name,'ڀ','ب')	
Name = utf8.gsub(Name,'ۀ','ه')	
Name = utf8.gsub(Name,'ـ','')	
Name = utf8.gsub(Name,'ﭓ','ي')	
Name = utf8.gsub(Name,'ﻞ','ل')	
Name = utf8.gsub(Name,'ڡ','ف')	
Name = utf8.gsub(Name,'ء','ء')	
Name = utf8.gsub(Name,'ﻎ','غ')	
Name = utf8.gsub(Name,'ﺙ','ث')	
Name = utf8.gsub(Name,'ﺜ','ث')	
Name = utf8.gsub(Name,'ﻌ','ع')	
Name = utf8.gsub(Name,'ﺚ','ث')	
Name = utf8.gsub(Name,'ﺝ','ج')	
Name = utf8.gsub(Name,'ہ','')	
Name = utf8.gsub(Name,'ځ','ح')	
Name = utf8.gsub(Name,'ﮓ','ك')	
Name = utf8.gsub(Name,'ڠ','غ')	
Name = utf8.gsub(Name,'ﻔ','ف')	
Name = utf8.gsub(Name,'ﻙ','ك')	
Name = utf8.gsub(Name,'ﻜ','ك')	
Name = utf8.gsub(Name,'ﻝ','ل')	
Name = utf8.gsub(Name,'ﻚ','ك')	
Name = utf8.gsub(Name,'ڂ','خ')	
Name = utf8.gsub(Name,'ۂ','')	
Name = utf8.gsub(Name,'ﻕ','ق')	
Name = utf8.gsub(Name,'ڣ','ف')	
Name = utf8.gsub(Name,'ﺘ','ت')	
Name = utf8.gsub(Name,'ﻍ','غ')	
Name = utf8.gsub(Name,'ﻗ','ق')	
Name = utf8.gsub(Name,'ﭻ','ج')	
Name = utf8.gsub(Name,'ﮆ','ذ')	
Name = utf8.gsub(Name,'ﭳ','ج')	
Name = utf8.gsub(Name,'ۃ','ة')	
Name = utf8.gsub(Name,'ڃ','ج')	
Name = utf8.gsub(Name,'ﺞ','ج')	
Name = utf8.gsub(Name,'ڢ','ف')	
Name = utf8.gsub(Name,'ﻘ','ق')	
Name = utf8.gsub(Name,'ی','ى')	
Name = utf8.gsub(Name,'ﮭ','ه')	
Name = utf8.gsub(Name,'ﮧ','')	
Name = utf8.gsub(Name,'ڌ','ذ')	
Name = utf8.gsub(Name,'̭','')	
Name = utf8.gsub(Name,'ﭸ','ج')	
Name = utf8.gsub(Name,'ﭼ','ج')	
Name = utf8.gsub(Name,'ﮯ','')	
Name = utf8.gsub(Name,'ﭬ','ف')	
Name = utf8.gsub(Name,'ڭ','ك')	
Name = utf8.gsub(Name,'ﮉ','ذ')	
Name = utf8.gsub(Name,'ﭭ','ف')	
Name = utf8.gsub(Name,'ۍ','ى')	
Name = utf8.gsub(Name,'ڍ','د')	
Name = utf8.gsub(Name,'ﭧ','')	
Name = utf8.gsub(Name,'ﮊ','ز')	
Name = utf8.gsub(Name,'ﺒ','ب')	
Name = utf8.gsub(Name,'ﭯ','ف')	
Name = utf8.gsub(Name,'ﭽ','ج')	
Name = utf8.gsub(Name,'ﯾ','ي')	
Name = utf8.gsub(Name,'ڬ','ك')	
Name = utf8.gsub(Name,'ﻃ','ط')	
Name = utf8.gsub(Name,'ڎ','ذ')	
Name = utf8.gsub(Name,'ێ','ئ')	
Name = utf8.gsub(Name,'ﻑ','ف')	
Name = utf8.gsub(Name,'ﯼ','ى')	
Name = utf8.gsub(Name,'ﻒ','ف')	
Name = utf8.gsub(Name,'ﮈ','د')	
Name = utf8.gsub(Name,'ﮡ','')	
Name = utf8.gsub(Name,'گ','ك')	
Name = utf8.gsub(Name,'ﻉ','ع')	
Name = utf8.gsub(Name,'ڏ','ذ')	
Name = utf8.gsub(Name,'ﺖ','ت')	
Name = utf8.gsub(Name,'ﭹ','ج')	
Name = utf8.gsub(Name,'ﮬ','ه')	
Name = utf8.gsub(Name,'ڮ','ك')	
Name = utf8.gsub(Name,'ﭺ','ج')	
Name = utf8.gsub(Name,'ﭢ','ت')	
Name = utf8.gsub(Name,'ڈ','د')	
Name = utf8.gsub(Name,'ۈ','و')	
Name = utf8.gsub(Name,'ﭤ','ت')	
Name = utf8.gsub(Name,'ﭠ','ت')	
Name = utf8.gsub(Name,'ﮥ','ه')	
Name = utf8.gsub(Name,'ک','ك')	
Name = utf8.gsub(Name,'ﺑ','ب')	
Name = utf8.gsub(Name,'ۉ','و')	
Name = utf8.gsub(Name,'ډ','د')	
Name = utf8.gsub(Name,'ﺗ','ت')	
Name = utf8.gsub(Name,'ﭥ','ت')	
Name = utf8.gsub(Name,'ﯡ','و')	
Name = utf8.gsub(Name,'ڨ','ق')	
Name = utf8.gsub(Name,'ي','ي')	
Name = utf8.gsub(Name,'ڊ','د')	
Name = utf8.gsub(Name,'ۊ','و')	
Name = utf8.gsub(Name,'ﮮ','')	
Name = utf8.gsub(Name,'ﻋ','ع')	
Name = utf8.gsub(Name,'ﯠ','و')	
Name = utf8.gsub(Name,'ﻊ','ع')	
Name = utf8.gsub(Name,'ﮦ','ه')	
Name = utf8.gsub(Name,'ﮢ','')	
Name = utf8.gsub(Name,'ﻈ','ض')	
Name = utf8.gsub(Name,'ﯿ','ي')	
Name = utf8.gsub(Name,'ۋ','و')	
Name = utf8.gsub(Name,'ڋ','د')	
Name = utf8.gsub(Name,'ﭣ','ت')	
Name = utf8.gsub(Name,'ﮤ','ه')	
Name = utf8.gsub(Name,'ﭮ','ف')	
Name = utf8.gsub(Name,'ﭫ','ف')	
Name = utf8.gsub(Name,'ﯽ','ى')	
Name = utf8.gsub(Name,'ﭡ','ت')	
Name = utf8.gsub(Name,'ﭾ','ج')	
Name = utf8.gsub(Name,'ﭦ','')	
Name = utf8.gsub(Name,'ﻐ','غ')	
Name = utf8.gsub(Name,'ڵ','ل')	
Name = utf8.gsub(Name,'ٵ','ا')	
Name = utf8.gsub(Name,'ﮔ','ك')	
Name = utf8.gsub(Name,'ﭗ','ب')	
Name = utf8.gsub(Name,'ﮜ','ك')	
Name = utf8.gsub(Name,'ﭝ','ي')	
Name = utf8.gsub(Name,'ڔ','ر')	
Name = utf8.gsub(Name,'ﻆ','ظ')	
Name = utf8.gsub(Name,'ﮌ','ر')	
Name = utf8.gsub(Name,'ﻪ','ه')	
Name = utf8.gsub(Name,'ڴ','ك')	
Name = utf8.gsub(Name,'ە','ه')	
Name = utf8.gsub(Name,'ﮗ','ك')	
Name = utf8.gsub(Name,'ﮝ','ك')	
Name = utf8.gsub(Name,'ﮙ','ك')	
Name = utf8.gsub(Name,'ﺓ','ة')	
Name = utf8.gsub(Name,'ڕ','ر')	
Name = utf8.gsub(Name,'ﮚ','ك')	
Name = utf8.gsub(Name,'ﮕ','ك')	
Name = utf8.gsub(Name,'ط','ط')	
Name = utf8.gsub(Name,'ﺪ','د')	
Name = utf8.gsub(Name,'ڷ','ل')	
Name = utf8.gsub(Name,'ٷ','ؤ')	
Name = utf8.gsub(Name,'ﺩ','د')	
Name = utf8.gsub(Name,'ﮘ','ك')	
Name = utf8.gsub(Name,'ﻁ','ط')	
Name = utf8.gsub(Name,'ﯝ','ؤ')	
Name = utf8.gsub(Name,'ﮱ','')	
Name = utf8.gsub(Name,'ﯚ','و')	
Name = utf8.gsub(Name,'ﻂ','ط')	
Name = utf8.gsub(Name,'ﭞ','ت')	
Name = utf8.gsub(Name,'ږ','ر')	
Name = utf8.gsub(Name,'̷','')	
Name = utf8.gsub(Name,'ٶ','ؤ')	
Name = utf8.gsub(Name,'ڶ','ل')	
Name = utf8.gsub(Name,'ﭜ','ي')	
Name = utf8.gsub(Name,'ﮎ','ك')	
Name = utf8.gsub(Name,'ﭲ','ج')	
Name = utf8.gsub(Name,'ڗ','ز')	
Name = utf8.gsub(Name,'ﮞ','')	
Name = utf8.gsub(Name,'̶','')	
Name = utf8.gsub(Name,'ڱ','ك')	
Name = utf8.gsub(Name,'ٱ','ا')	
Name = utf8.gsub(Name,'ر','ر')	
Name = utf8.gsub(Name,'ﺭ','ر')	
Name = utf8.gsub(Name,'ﭙ','ب')	
Name = utf8.gsub(Name,'ﺔ','ة')	
Name = utf8.gsub(Name,'ﺽ','ض')	
Name = utf8.gsub(Name,'ڐ','ذ')	
Name = utf8.gsub(Name,'ې','ي')	
Name = utf8.gsub(Name,'ﺕ','ت')	
Name = utf8.gsub(Name,'ﮟ','')	
Name = utf8.gsub(Name,'ڰ','ك')	
Name = utf8.gsub(Name,'ﻄ','ط')	
Name = utf8.gsub(Name,'ﻩ','ه')	
Name = utf8.gsub(Name,'ﺛ','ث')	
Name = utf8.gsub(Name,'ﮏ','ك')	
Name = utf8.gsub(Name,'ۑ','ى')	
Name = utf8.gsub(Name,'ڑ','ر')	
Name = utf8.gsub(Name,'ﻇ','ظ')	
Name = utf8.gsub(Name,'ٳ','ا')	
Name = utf8.gsub(Name,'ﺡ','ح')	
Name = utf8.gsub(Name,'ڳ','ك')	
Name = utf8.gsub(Name,'ﮪ','ه')	
Name = utf8.gsub(Name,'ﻛ','ك')	
Name = utf8.gsub(Name,'ﺼ','ص')	
Name = utf8.gsub(Name,'ﻅ','ظ')	
Name = utf8.gsub(Name,'ﻬ','ه')	
Name = utf8.gsub(Name,'̐','')	
Name = utf8.gsub(Name,'ﺂ','ا')	
Name = utf8.gsub(Name,'͠','')	
Name = utf8.gsub(Name,'ﮠ','')	
Name = utf8.gsub(Name,'ﻰ','ى')	
Name = utf8.gsub(Name,'ﭿ','ج')	
Name = utf8.gsub(Name,'ﮀ','ج')	
Name = utf8.gsub(Name,'ﮇ','ذ')	
Name = utf8.gsub(Name,'ﮍ','ر')	
Name = utf8.gsub(Name,'ﮐ','ك')	
Name = utf8.gsub(Name,'ﭷ','ج')	
Name = utf8.gsub(Name,'ﮰ','')	
Name = utf8.gsub(Name,'ے','')	
Name = utf8.gsub(Name,'پ','ب')	
Name = utf8.gsub(Name,'ﻨ','ن')	
Name = utf8.gsub(Name,'Ζ','z')	
Name = utf8.gsub(Name,'ﭚ','ب')	
Name = utf8.gsub(Name,'ﭘ','ب')	
Name = utf8.gsub(Name,'ٲ','ا')	
Name = utf8.gsub(Name,'ڲ','ك')	
Name = utf8.gsub(Name,'ﭖ','ب')	
Name = utf8.gsub(Name,'ﭕ','ي')	
Name = utf8.gsub(Name,'ﭔ','ي')	
Name = utf8.gsub(Name,'ﻏ','غ')	
Name = utf8.gsub(Name,'ﻀ','ض')	
Name = utf8.gsub(Name,'ګ','ك')	
Name = utf8.gsub(Name,'ڪ','ك')	
Name = utf8.gsub(Name,'ڧ','ف')	
Name = utf8.gsub(Name,'ڤ','ق')	
Name = utf8.gsub(Name,'ﮖ','ك')	
Name = utf8.gsub(Name,'ﺬ','ذ')	
Name = utf8.gsub(Name,'ڒ','ر')	
Name = utf8.gsub(Name,'ﺨ','خ')	
Name = utf8.gsub(Name,'ﭱ','ف')	
Name = utf8.gsub(Name,'ﻓ','ف')	
Name = utf8.gsub(Name,'ﺱ','س')	
Name = utf8.gsub(Name,'ﺫ','ذ')	
Name = utf8.gsub(Name,'ﺐ','ب')	
Name = utf8.gsub(Name,'ﮩ','')	
Name = utf8.gsub(Name,'ﮨ','')	
Name = utf8.gsub(Name,'ﮣ','')	
Name = utf8.gsub(Name,'ﭰ','ف')	
Name = utf8.gsub(Name,'ۓ','')	
Name = utf8.gsub(Name,'ړ','ر')	
return Name
end


function FlterEmoje(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"[🤚🔕♠🤗😇💂🌶🤣🚹⛸⚠😅🍕🍛🧝🌿💛#😕🧞*1032547🥌98🎡🎋🏼🎰🤑🚮☠🥜⃣🛌🌙🚙👏🛍💑⛳🏌🍢👲🔡❤🐀😨🥁🦇🏣㊗💰🚒🌟🐾🦅🐃🐷🤲🎩📳🇼🍎👛◻💻➗🔪🎂🌪🔔🍊✊🐚🍽🍫❗🚴🎒♏🧢🍁🌓😸🍦󠁢😶🗓🐡🛠✏😉🎯🍋🎟🔳🌨🎱💟⛏🤳📆🔅🍴📲🥊🖍🌡📬🆑🐇🗺😾🕰📵🏈🇮🍥➰🤠👥🕥😃😤😔🐹🎬⌛💎☃📖🔨👫🙄🥒⚜🏫🥃🍘🥥📍🦕💜🗝🙃🕤🐯👤🧔🏭🚭🚘💒🐓👁🤾🏐🏮🚋🌾📗🥈📚🤧🏃〰👱🔧🥖🇾☘🔘🔙⚗🛡🏖💹🉑🚛💩🛏♋🔸💴⏬✋👷😞☎🦂🎽🐞️🌘🌄⛵🈺🏸🎍📝🐪🍑😙🤓⚓󠁴💠🌔😵🥦📇🐌♓😘😢🐙🕦🏆🚨❇🙎🔶🛂🍲🥟📉🐕🍳🚈🔞😳🔌😊🌅🔊⛓🚻🚁✨💢🌊⚛😆😿🎈🏗🇭❓🙀🐨🚡🤢🔃▫🇶👿🤤📋🖋👕🐔😮🔵👂🌏⏏👦🐧🕎◾🍺🌧🖐📟🧙👶🌤↖🏬🤜⌚🏋🛐™🍜🤯🧣↘🔣🐣🥘🎫🎌😓🗨🚐🧚💲🍡😪🙏🖖⛽🏑⛲🎢🥗🚌🦁🚆☺🕒🎛⛹💏🐼🍶🚑🕞🤮🕕⏫🤰‼🎥🏀😰🌎📻󠁥🍂🇻🎴👸💼➖💆🕹👧🛩🍚❣🍓🤥🐄🍒♎🔽👵🔓🍠💍🏉▶🎠🎊👡📎💖🔺😺🍱📀⛎😽😷☣🦃🌯⛷🖼🚄💬🤐🦎♣🚦🍹‍🌱🛃🦄🦒🐈🕸🏟✖🚍😥↪🤝🏇⬇🌦🔄🚖⏺⬛♂⏲💁🚧🔤🚼👞🏄😩☂🕜🌚🧒⏯🎮🏯🌭🍵🔭💐🐤🕠💗🚎🛋🍧🤔🏽👒🤷🇸👘☝👴🔷⚖✴🉐✂🥂🕊👹⛴👅🚞😂📪🐺🦀󠁣🌃✉♒🤩🥕🎖🚀🕢😟🕵🇪👃🎑🏪🤟💿🥫😚🏩🏔🍏👢🏙📈⚒💝👠🎲🚲🖲⁉🇨🌳🚯🧀🕌🛶⛪🍌🧓🙈🇿⤴😬☪⚽🌈📔㊙💇🇯🗿🙁🍅☯🍞😠👍🕴▪👊💋🖱🎗🙌😎🐦🥡🔦💉🌺🔰🛣🕘🎶👳🍮🌜🐰↙🚔🕖🎿↕🐑🔛⛺🖕🧜🔟🖨🏕🎻🥝🎾🥐🤙🈳⚾🗑👣🚗🥧🏤🚕😒🤬🛷🤱🚏🚅🐂🐋🐜🤘⏪🦗⚱🔻👌〽👼💀👝☦⛱⏹󠁷📼📄🕺🎓😍🚩󠁧🔹🧡🥨➕🦌🤹ℹ🎉♉💨🏴💥🗼🏥🤪👮󠁳🏊🧟👖🙉☢🙇🔒👬📱🍈🏘🍐🕐😫🛄🧠🛥👭🎇🍭🤡🦑♍🐟🚃💧😋🚸🕍🚾✍🗽😹🎹🛒🧥🔎👓🚚🦖📷🤛👗🔜🥔🍖😄🔠💘🐴🤕󠁬🎄🧖🍗😈😧🈷🐽🌂♑💯🛑📁🧑🛰🎨☕🐒☑⛈🤨👐⛑🇳🔢🎞💪🍀⏸🌍💙🍃👺🍍🈸😜🈂⏮↩🌩🌵✈🏁😻👚🎙👋🔈☮🍬⛅🍸🐍🤫🎅🚿🏎🏳😁🚵💞🐢🐩💃😛🎪😴🕋🍆📯🥀💅🚳🙂🤶🌑⭕☁🥋👇🌌🍝😡⏱🔆🗯💶🥠🆓🌲👀🚢🕚💔🍇🦍⚕🇱🇰🦓🎧🥉🏺◼🌰🧦🔍💊🐠🌼🛎✅☸⚡💌👉🤵💕🚣📰👑🌽🚓😑📏👔♥◀🤽🐝🕛😌🧗🈵🗒🔐🈴🌕🌛🦐🎣🥞💣↔👾🅰😐🕟🥙👰🐏🚷🐆📡🥇👻🐲🌸🧘♨🎼🌗🌠✡🎤🅿🚬⛰🤞🍙🏓🔝💳🦋🕉🥚🔖🍪🛫🗜🔬🏡🤭🏚🔥❔💄🌥🕔✌🌫󠁮🐁👟🐛♈😭🌋🇦🔑🌞🐊🏷📒🎦🌴🍟🚉🍉💓🐮💷🔱💽🚇🐫🚥🐘🌐🥑🔲🛤🙍🐬📧⬅🐥⛔󠁿🏹👨🌝🇽🐖📿🔼😖😼📘🙋🥛🚺⏩🍾🗞🌹📠🗾🔗🏵🎃😝🖤🏒🛸🍯🦈🚜🔁🎭🌁💤😦💦👯®🏞👽👩💺💱📢🤖📸©👪🦆👙🦔📴🧐⏭🇴👄💚🎚📹🛢🐐🇷🍄🌖😀🌬🧤🐿❄🕝🍩🛵🔏🖊✒🍔🖌🖇🔇📐🧕📕📊📙📂🗂📓📅🗣🗳🗄📜📨🏅📑📤📦📫🔯📭📮🎐📩🈁🗡📃📥🎁🎏🛴🎀🎎😗🚪🚽🚰🕓♀🆕🐸💈🕳🐭🔋⚰😱🔩⚙🔫💡🕯🚟💸🕗💵⏰⏳📺📽📞🛳💾🕧🙊⌨🖥🕡🕣🕙🀄☀🕑🏢🛁💭♦🇲🃏🔉📣🎳🏜⬜⚪⚫🔴➿🔚✔🤦🏍🔂🎵⤵🔀➡⬆↗6🎺🆙🆒🔮🆖🆗🏧🛅🇺♿🦉💥✳❎⛩Ⓜ🌀♻🥅🈯🚱💥🚫🏠🅱🕶🌆🎸🚂🅾🆘☄❌🈹🈲🈶🈚☹🆚💮⭐🆔🐗♌♐🤴☔♊😯✝🇵📶🇹🇧🇩🇬🇫🎆🌇🌉🏛🏦🏨🏝◽😲🗻⛄🏰🚤🚊🛬🚝🚠🎷🆎🤸🤺🏂🤼🏏🥣🥢🍷🥄🍼🌻🥤🍻🍿🍰🌮🍣🍤🥪🍨🥓🥩💥🌒💫🌷🐉🐎🦏🐳🐅🕷😏🐵🐶🐱⚔🦊??👜💥💥*┇*🙅🙆🧛📌🗃👆👎🤒😣]",'')	

return Name
end
