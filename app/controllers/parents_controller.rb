class ParentsController < ApplicationController
    def show
        @parent = Parent.find(params[:id])
        @childs = @parent.childs.all
    end

    def new
        @parent = Parent.new
        @child = Child.new
    end

    def create
        parent = Parent.new(post_params)
        parent.save
        child = Child.new
        child.parent_id = parent.id
        child.childname = params[:childname]
        child.save
        redirect_to parent_path(parent)
    end

    private
    def post_params
        params.require(:parent).permit(:parentname)
    end
end
