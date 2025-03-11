*** Variables ***
${btn_login_admd}                                   xpath=//button/span[normalize-space(text())="Login ADMD"]
${btn_login_on_welcome}                             xpath=//a[@class="text-sgl-success text-decoration-none" and text()="Login"]                   
${txt_unidentifier}                                 xpath=//input[@id="ldap_username"]
${txt_pwidentifier}                                 xpath=//input[@id="ldap_password"]
${btn_login}                                        xpath=//button[@id="่ldap_btn_sign_in"]
${lbl_unidentifier_login}                           xpath=//div[@class="vx-navbar-wrapper navbar-default"]//p[@class="font-semibold"]
${lbl_status_login}                                 xpath=//div[@class="vx-navbar-wrapper navbar-default"]//small
${lbl_sidemenu_home}                                xpath=//div[@class="scroll-area-v-nav-menu pt-2"]//span[@class="truncate"][text()="Home"]
${img_profile_ais}                                  xpath=//button//img[@alt="user-img"]
${lbl_logout}                                       xpath=//div[@class="vs-dropdown--custom vs-dropdown--menu"]//span[text()="Logout"]
${lbl_login}                                        xpath=//h4[text()="Login"]
${lbl_welcome}                                      xpath=//div[@class="vx-card__title mb-4"]/p[text()="Welcome back, please login to your account."]
${lbl_wrong_email_or_pwidentifier}                  xpath=//h2[@id="swal2-title"]
${lbl_please_check_email_or_pwidentifier}           xpath=//div[@id="swal2-content"]
${btn_close_popup}                                  xpath=//button[contains(@class, 'swal2-confirm')][text()="Close"]
${lbl_error_unidentifier}                           xpath=//div[@id="ldap_username_valid"]
${lbl_error_pwidentifier}                           xpath=//div[@id="ldap_password_valid"]
${lst_product}                                      //div[contains(@class, 'vs-sidebar')]  
${lst_menu}                                         //div[contains(@class, 'vs-sidebar')]
${lst_sub_menu}                                     //div[@class="vs-sidebar-group ml-8 vs-sidebar-group-open"]
${lst_cal_menu}                                     xpath=//div[@class="vx-input-group-default flex-grow"]
${lst_date_time}                                    xpath=//input[@class="w-full text-center flatpickr-input"]
${btn_cal_down}                                     xpath=//div[@class="flatpickr-month"]//span[@class="arrowDown"]
${btn_cal_up}                                       xpath=//div[@class="flatpickr-month"]//span[@class="arrowUp"]
${ddl_lst_month}                                    xpath=//select[@class="flatpickr-monthDropdown-months"]
${btn_close_datetimepicker}                         xpath=//span[@class="text-danger" and text()='X']
${pnl_datetimepicker}                               xpath=//div[@class="flatpickr-calendar hasTime rangeMode animate arrowTop arrowLeft open"]
${txt_cal_hour}                                     xpath=//input[@class="numInput flatpickr-hour"]
${txt_cal_min}                                      xpath=//input[@class="numInput flatpickr-minute"]
${txt_cal_sec}                                      xpath=//input[@class="numInput flatpickr-second"]

#  - List prefix name -
# Lable             lbl        
# DropDownList      ddl
# TextBox           txt        
# Table             tbl
# DateTimePicker    dtp
# Button            btn        
# List              lst
# RadioButton       rdo
# Toggle            tgg        
# MenuList          mnu
# CheckBox          cbx        
# TabPage           tab
# Panel             pnl
# Image             img        
# ProgressBar       prg
# Icon              icn
# PlaceHolder       phd
