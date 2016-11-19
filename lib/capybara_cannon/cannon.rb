module CapybaraCannon
  class Cannon
    def evaluate
      configuration = CapybaraCannon.configuration
      contents = File.read(configuration[:file])
      Evaluator.new.instance_eval(contents, configuration[:file], 1)
    end
  end
end
