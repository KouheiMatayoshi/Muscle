class TrainingsController < ApplicationController
  before_action :authenticate_user!

    def index
        @trainings = Training.all
    end
    def new
        @trainings=Training.new 
      end

      def create
        trainings = Training.new(trainings_params)
        trainings.user_id = current_user.id 
        url = params[:youtube_url]
        if url.present?
          trainings.youtube_url = url
        end
        if trainings.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @trainings = Training.find(params[:id])
      end

      def edit
        @trainings = Training.find(params[:id])
      end

      def update
        trainings = Training.find(params[:id])
        if trainings.update(trainings_params)
          redirect_to :action => "show", :id => trainings.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        trainings = Training.find(params[:id])
        trainings.destroy
        redirect_to action: :index
      end

      

      private
      def trainings_params
        params.require(:training).permit(:title, :show, :youtube_url, :user_id, :category)
      end

end
