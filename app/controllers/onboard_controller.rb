# frozen_string_literal: true
class OnboardsController < ApplicationController
    before_action :set_account, only: [:update]
      before_action :onboard_status?
      skip_before_action :check_onboading

      def show
        if current_admin.pending? || current_admin.finish?
          flash[:notice] = 'Welcome aboard'
          redirect_to authenticated_admin_root_path
        else
          @merchant = current_admin.merchants.new
          @artist = current_admin.artists.new
        end
      end

      def update
        if current_admin.step1?
          step1
        elsif current_admin.step2?
          step2
        elsif current_admin.step3?
          step3
        end

        if current_admin.finish?
          redirect_to authenticated_admin_root_path
        else
          Rails.logger.debug current_admin.errors.inspect
          redirect_to admin_onboarding_path
        end
      end

      def step1
        @account.roles << params[:admin][:roles]
        Rails.logger.debug "MERGEE #{params_account}"
        if @account.update(params_account)
          current_admin.update_columns(onboard: 2)
        end
        Rails.logger.debug "step1 #{@account.errors.inspect}"
        flash[:notice] = 'Update Personal Detail is Success'
      end

      def step2
        Rails.logger.debug "masuk step2"
        current_admin.update_columns(onboard: 3)
        flash[:notice] = "Successfully created #{current_admin.roles} account"
      end

      # step3 update accounts
      def step3
        if current_admin.update(step3_params)
          current_admin.update(onboard: :finish, status: :pending, set_pin: false)
          Rails.logger.debug(current_admin.errors.inspect)
          flash[:notice] = 'Welcome aboard'
        end
      end

      private

      def onboard_status?
        return if current_admin.onboarding?

        redirect_to authenticated_admin_root_path
      end

      def set_account
        @account = Admin.find(current_admin.id)
      end

      def params_account
        params.require(:admin).permit(:eth_address, :phone_number, :gender, :id_number, :id_type)
      end
    end
  end
