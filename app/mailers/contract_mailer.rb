# -*- encoding : utf-8 -*-
require 'postageapp/mailer'
class ContractMailer < PostageApp::Mailer
  default from: "support@confirmmygig.com"
  def event_info_email(user, contract, additional)
      @user = user
      @contract = contract
      @additional = additional
      postageapp_template 'eventinfo_template'
     mail( to: user.email,
           subject: "Event info -" "#{contract.act_booked} - #{contract.contract_number} - #{contract.eventtime} - #{contract.date_of_event.to_formatted_s(:eventdate)}")
   end

   def event_info_email_with_all_money(user, contract, additional)
       @user = user
       @contract = contract
       @additional = additional
       postageapp_template 'eventinfo_template'
      mail( to: user.email,
            subject: "Event info -" "#{contract.act_booked} - #{contract.contract_number} - #{contract.eventtime} - #{contract.date_of_event.to_formatted_s(:eventdate)}")
    end


    def event_info_email_with_net_money(user, contract, additional)
        @user = user
        @contract = contract
        @additional = additional
        postageapp_template 'eventinfo_template'
       mail( to: user.email,
             subject: "Event info -" "#{contract.act_booked} - #{contract.contract_number} - #{contract.eventtime} - #{contract.date_of_event.to_formatted_s(:eventdate)}")
     end

     def event_info_email_with_no_money(user, contract, additional)
         @user = user
         @contract = contract
         @additional = additional
         postageapp_template 'eventinfo_template'
        mail( to: user.email,
              subject: "Event info -" "#{contract.act_booked} - #{contract.contract_number} - #{contract.eventtime} - #{contract.date_of_event.to_formatted_s(:eventdate)}")
      end
   def send_reminder(user)
    # @user = user
    postageapp_template 'eventinfo_template'
     mail(  from: "support@confirmmygig.com",
            to: user,
            subject: "Please Confirm Jobs")
   end

   def send_user_reminder(user)
    # @user = user
    postageapp_template 'eventinfo_template'
     mail(  from: "support@confirmmygig.com",
            to:user,
            subject: "Please Confirm Jobs")
            #body: "You have unconfirmed Events"
   end

   def newactcodes(actcodes)
     mail(  from: "support@confirmmygig.com",
            to:"iamjustfresh@gmail.com,strick@washingtontalent.com",
            subject: "New Actcodes Not in database",
            body: actcodes)
   end

   def notconfirmed(user)
      mail(  from: "support@confirmmygig.com",
             to:user,
             subject: "Dear WTA Valued Vendor",
             #body: actcodes
             )
    end

   def deliver(user,contract,additional)
      ContractMailer.event_info_email(user,contract,additional).deliver
      contract.update_attributes(confirmation: 1)
    end


end


