class Admin::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
		if params[:period_select] == "today"
			@title = "本日のデータ"
			period_search(Time.current.all_day)
		elsif params[:period_select] == "week"
			@title = "今週のデータ"
			period_search(Time.current.all_week)
		elsif params[:period_select] == "month"
			@title = "今月のデータ"
			period_search(Time.current.all_month)
		elsif  params[:period_select] == "year"
			@title = "今年のデータ"
			period_search(Time.current.all_year)
		else
			@users = User.all
			@members = User.where(status: true)
			@withdrawals = User.where(status: false)
		end
	end

	private
	def period_search(a)
		@users = User.where(created_at: a)
		@members = User.where(status: true,created_at: a)
		@withdrawals = User.where(status: false,updated_at: a)
	end
end
