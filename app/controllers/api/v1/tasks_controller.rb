module Api
    module V1
        class TasksController < ApplicationController
            def index
                tasks = Task.order('priority DESC')
                render json: {status: 'SUCESS', message:'Loaded tasks', data:tasks},status: :ok
            end

            def show
                task = Task.find(params[:id])
                render json: {status: 'SUCESS', message:'Loaded task', data:task},status: :ok
            end

            def create
                task = Task.new(task_params)

                if task.save
                    render json: {status: 'SUCESS', message:'Saved task', data:task},status: :ok
                else
                    render json: {status: 'ERROR', message:'Task not saved', data:task.errors},status: :unprocessable_entity
                end
            end

            def destroy
                task = Task.find(params[:id])
                task.destroy
                render json: {status: 'SUCESS', message:'Deleted task', data:task},status: :ok
            end

            def update
                task = Task.find(params[:id])
                
                if task.update_attributes(task_params)
                    render json: {status: 'SUCESS', message:'Updated task', data:task},status: :ok
                else
                    render json: {status: 'ERROR', message:'Task not updated', data:task.errors},status: :unprocessable_entity
                end
            end

            private

            def task_params
                params.permit(:name, :description, :difficulty, :priority);
            end
        end
    end
end