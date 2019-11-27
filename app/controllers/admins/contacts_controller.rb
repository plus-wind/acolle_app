class Admins::ContactsController < ApplicationControlle
    layout "admins"
    before_action :authenticate_admin!
end
