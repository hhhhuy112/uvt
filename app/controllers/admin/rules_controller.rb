class Admin::RulesController < ApplicationController
  before_action :destroy_rules, only: :create
  before_action :load_data, only: :create

  def index
    @search = Knowledge.ransack(params[:q])
    @knowledges = @search.result
    @knowledges = @knowledges.page(params[:page]).per Settings.per_page.admin.knowledge
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def create
    destroy_rules
    create_know_service = CreateRulesDecisionTreeService.new(@classifications, DataCancer.all)
    abc = create_know_service.c45_algorithm(@data_cancers, @fictions, nil)
     f = File.open("/home/ubuntu/datn/data/tree.txt", "w")
     f.write(abc)
     f.close
    convert_node_to_rule
    flash[:success] = t("admin.knowledges.create_knowledges_success")
    redirect_to admin_knowledges_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def convert_node_to_rule
    convert_rule = ConvertDecisionTreeToRulesService.new
    convert_rule.convert
  end

  def destroy_rules
    Node.delete_all
    Rule.delete_all
  end

  def load_data
    @data_cancers = DataCancer.all
    @classifications = Classification.all
    @fictions = Fiction.all
  end
end
