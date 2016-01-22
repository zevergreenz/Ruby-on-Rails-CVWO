class WorksController < ApplicationController
	def index
		if params[:search]
			@works = Work.search(params[:search]).order("datetime ASC")
		else
			@works = Work.order("datetime ASC")
		end
	end

	def show
		@work = Work.find(params[:id])
	end

	def new
		@work = Work.new
	end
	
	def edit
		@work = Work.find(params[:id])
	end
	
	def create
		@work = Work.new(work_params)
		
		if @work.save
			redirect_to @work
		else
			render 'new'
		end
	end
	
	def update
		@work = Work.find(params[:id])
		
		if @work.update(work_params)
			redirect_to @work
		else
			render 'edit'
		end
	end
	
	def destroy
		@work = Work.find(params[:id])
		@work.destroy
		
		redirect_to works_path
	end
	
	private
		def work_params
			params.require(:work).permit(:tag, :item, :datetime)
		end
end
