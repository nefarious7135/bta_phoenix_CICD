*** Variables ***
${lst_order_tab}                                    //div[@class="con-ul-tabs"]/ul/li
${btn_filter_fields}                                xpath=//div/span[normalize-space(text())="Fields"] 
${btn_select_all}                                   xpath=//button/span[normalize-space(text())="Select All"]
${tab_active}                                       //li[contains(@class, 'activeChild')] 
${btn_close_field_popup}                            xpath=//h3[text()="Select field to table"]/../../i[text()="close"]
${btn_search_id}                                    xpath=//span[normalize-space(text())="Search Id"]/../input
${area_content_page}                                xpath=//div[@class="content-area__content"]
${lst_result_table_id}                              (//table[@class="vs-table vs-table--tbody-table"]/tr/td[3]//pre)
# ${dtp_searth_datetime}                              xpath=//div[@class='vx-input-group-default flex-grow']
${ddl_state}                                        xpath=//div[@id='vs1__combobox']
${lst_result_table_state}                           (//table[@class="vs-table vs-table--tbody-table"]/tr/td[8]//span[contains(@class, 'text-chip')])
${txt_privateIdType}                                xpath=//input[@name='privateIdType']
${lst_result_privateIdType}                         (//table[@class="vs-table vs-table--tbody-table"]/tr/td[4]//pre)
${txt_privateIdValue}                               xpath=//input[@name='privateIdValue']
${lst_result_privateIdValue}                        (//table[@class="vs-table vs-table--tbody-table"]/tr/td[5]//pre)
${txt_publicIdType}                                 xpath=//input[@name='publicIdType']
${lst_result_publicIdType}                          (//table[@class="vs-table vs-table--tbody-table"]/tr/td[6]//pre)
${txt_publicIdValue}                                xpath=//input[@name='publicIdValue']
${lst_result_publicIdValue}                         (//table[@class="vs-table vs-table--tbody-table"]/tr/td[7]//pre)
${ddl_method}                                       xpath=//div[@id='vs4__combobox']
${lst_result_table_method}                          (//table[@class="vs-table vs-table--tbody-table"]/tr/td[13]//span[contains(@class, 'text-chip')])
${lst_result_table_create_date}                     //table[@class="vs-table vs-table--tbody-table"]/tr/td[9]//span
# ${txt_err_message}                                  xpath=//div[@class='vs-component vs-con-textarea w-84per vs-textarea-primary']//textarea[@name='errorMsg']
${lst_result_err_message}                           (//table[@class="vs-table vs-table--tbody-table"]/tr/td[10]//pre)
${txt_url}                                          xpath=//span[normalize-space(text())="Uri..."]/../input
${lst_result_url}                                   (//table[@class="vs-table vs-table--tbody-table"]/tr/td[12]//pre)
${dtp_close}                                        xpath=//div[@class='vx-input-group-append flex border border-solid border-grey border-l-0']


# Text Box Search
${txt_private_id_type}                              xpath=//input[@type="text" and @name="privateIdType"]
${txt_private_id_val}                               xpath=//input[@type="text" and @name="privateIdValue"]
${txt_public_id_type}                               xpath=//input[@type="text" and @name="publicIdType"]
${txt_public_id_val}                                xpath=//input[@type="text" and @name="publicIdValue"]
${txt_err_msg}                                      xpath=//div[@class="vx-row items-center mb-0 pl-5"]//textarea[@name="errorMsg"]
${txt_uri_val}                                      xpath=//div[@class="mb-12 ml-20"]//input[@type="text" and @name="uri"]
${txt_method_val}                                   xpath=//div[@class="mb-12 ml-20"]//input[@type="search" and @placeholder="Select Method"]

# Dropdown Criteria
${btn_filter_criteria}                              xpath=//div/span[normalize-space(text())="Criteria"]
${cbx_filter_criteria_private}                      xpath=//ul[@class="vs-component vs-dropdown--menu"]//div/span[normalize-space(text())="Private Id Type / Value"]/../input[1]
${cbx_filter_criteria_public}                       xpath=//ul[@class="vs-component vs-dropdown--menu"]//div/span[normalize-space(text())="Public Id Type / Value"]/../input[1]
${cbx_filter_criteria_error_msg}                    xpath=//ul[@class="vs-component vs-dropdown--menu"]//div/span[normalize-space(text())="Error Message"]/../input[1]
${cbx_filter_criteria_uri}                          xpath=//ul[@class="vs-component vs-dropdown--menu"]//div/span[normalize-space(text())="URI"]/../input[1]
${cbx_filter_criteria_method}                       xpath=//ul[@class="vs-component vs-dropdown--menu"]//div/span[normalize-space(text())="Method"]/../input[1]
${cbx_filter}                                       //ul[@class="vs-component vs-dropdown--menu"]//div

# Dropdown Number Of Row
${lbl_show_data_default}                            xpath=//button[@type="button"]/div/span[normalize-space(text())="10" or normalize-space(text())="20" or normalize-space(text())="30" or normalize-space(text())="50" or normalize-space(text())="100"]
${ddl_show_data}                                    xpath=//li[@class="vs-component vs-dropdown--item"]

# Count Row Data In Table
${tbl_data}                                         xpath=//div[@class="con-tab vs-tabs--content"]//thead[@class="vs-table--thead"]
${tbl_row_data}                                     xpath=(//tr[@class="tr-values vs-table--tr tr-table-state-null selected"])

#Table Result
${txt_table_result}                                 xpath=//div[@class='con-slot-tabs']//div[contains(concat(' ',normalize-space(@class),' '), 'right')]/div[contains(text(),"results found.")]
${lbl_no_data_avilable}                             xpath=//div[@id="mponew"]//div[normalize-space(text())='No data Available']
${lst_table_state}                                  xpath=(//div[@class="con-vs-chip vs-chip-success con-color bg-chip-transparent"]//span)
${lst_table_method}                                 xpath=(//div[@class="con-vs-chip vs-chip-null bg-chip-transparent"]//span)

${pnl_loading}                                      xpath=//div[@class="con-vs-loading vs-loading-background-undefined vs-loading-color-undefined"]
${btn_home}                                         xpath=//span[@class='truncate' and text() ='Home']
${tbl_create_day}                                   //td[@class="td vs-table--td"][8]


#Task
${dtp_state_task}                                   xpath=//div[@id='vs1__combobox']
${lst_result_table_state_task}                      (//table[@class="vs-table vs-table--tbody-table"]/tr/td[7]//span[contains(@class, 'text-chip')])
${txt_instance_id}                                  xpath=//div[@class="mb-12 ml-20"]//input[@type="text" and @name="instanceId"]            
${lst_result_instance_id}                           (//table[@class="vs-table vs-table--tbody-table"]/tr/td[4]//pre)
${txt_name}                                         xpath=//div[@class="mb-12 ml-20"]//input[@type="text" and @name="name"]
${lst_result_name}                                  (//table[@class="vs-table vs-table--tbody-table"]/tr/td[5]//pre)
${txt_err_msg_task}                                 xpath=//div[@class="mb-12 ml-20"]//textarea[@name="errorMsg"]  
${lst_result_err_msg_task}                          (//table[@class="vs-table vs-table--tbody-table"]/tr/td[10]//pre)
${txt_external_system}                              xpath=//div[@class="mb-12 ml-20"]//input[@type="text" and @name="externalSystem"]
${lst_result_external_system}                       (//table[@class="vs-table vs-table--tbody-table"]/tr/td[9]//pre)
${tbl_create_day_task}                              //td[@class="td vs-table--td"][7]