
module RailsAdmin
    module Config
      module Actions
        # common config for custom actions
        class Customaction < RailsAdmin::Config::Actions::Base
          register_instance_option :member do  #	this is for specific record
            true
          end
          register_instance_option :pjax? do
            false
          end
          register_instance_option :visible? do
            authorized? 		# This ensures the action only shows up for the right class
          end
        end

        class Approve < Customaction
            RailsAdmin::Config::Actions.register(self)
            register_instance_option :only do
                Post
              # model name here
            end
            register_instance_option :link_icon do
              'fa fa-paper-plane' # use any of font-awesome icons
            end
            register_instance_option :http_methods do
              [:get, :post]
            end
            register_instance_option :controller do
              Proc.new do
                # Post.approve
                @object.update(status: "active")
                # call model.method here
                #flash[:notice] = "Did custom action on #{@object.name}"
                redirect_to back_or_index
              end
            end
          
        end


        class Status < Customaction
            RailsAdmin::Config::Actions.register(self)
            register_instance_option :only do
                User
              # model name here
            end
            register_instance_option :link_icon do
              'fa fa-paper-plane' # use any of font-awesome icons
            end
            register_instance_option :http_methods do
              [:get, :post]
            end
            register_instance_option :controller do
              Proc.new do
                # Post.approve
                @object.update(status: "active")
                # call model.method here
                #flash[:notice] = "Did custom action on #{@object.name}"
                redirect_to back_or_index
              end
            end
          
        end


        
       end
    end
end