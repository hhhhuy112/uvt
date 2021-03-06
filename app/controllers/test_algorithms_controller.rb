class TestAlgorithmsController < ApplicationController
  before_action :set_test_algorithm
  before_action :map_infor

  def index
    @title = t "admin.test_algorithms.title"
  end
  private

  def map_infor
    @naive_bayes = {
      training: infor_traning(@naive_training),
      test: infor_traning(@naive_test),
    }
    @c45_algorithm = {
      training: infor_traning(@c45_training),
      test: infor_traning(@c45_test),
    }
    @id3_algorithm = {
      training: infor_traning(@id3_training),
      test: infor_traning(@id3_test),
    }
  end

  def infor_traning test_algorithm
    if test_algorithm.present?
      test_true = I18n.t ("admin.test_algorithms.test_true")
      test_false = I18n.t ("admin.test_algorithms.test_false")
      test_non =  I18n.t ("admin.test_algorithms.test_non")
      {
        "#{test_true}": test_algorithm.true_probability,
        "#{test_false}": test_algorithm.fault_probability,
        "#{test_non}": test_algorithm.not_condition_probability
      }
    else
      nil
    end
  end

  def set_test_algorithm
    @naive_training = get_test_algorithm "naise_bayes", "training"
    @naive_test = get_test_algorithm "naise_bayes", "test"
    @c45_training = get_test_algorithm "c45_algorithm", "training"
    @c45_test = get_test_algorithm "c45_algorithm", "test"
    @id3_training = get_test_algorithm "id3_algorithm", "training"
    @id3_test = get_test_algorithm "id3_algorithm", "test"
  end

  def get_test_algorithm type_diagnose, type_data
    TestAlgorithm.find_by type_diagnose: type_diagnose, type_data: type_data
  end
end
