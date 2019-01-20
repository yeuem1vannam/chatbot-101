class FlowMap

  include Stealth::Flow

  flow :developer do
    state :say_restart
    state :set_test
  end

  flow :hello do
    state :say_hello
  end

  flow :goodbye do
    state :say_goodbye
  end

  flow :catch_all do
    state :level1
  end

end
