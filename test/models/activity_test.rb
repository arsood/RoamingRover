require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def test_activity_can_be_created_with_no_arguments
	assert_instance_of Activity, Activity.new
  end
  
 #  def test_title
	# assert_instance_of title, title.new
 #  end
  
 #  def test_text
	# assert_instance_of text, text.new
 #  end

 #  def test_client_id_integer
	# assert_instance_of client_id, client_id.new
 #  end
  
 #  def test_rate_varchar255
	# assert_instance_of rate, rate.new
 #  end

 #  def test_date
	# assert_instance_of date, date.new
 #  end
  
 #  def test_time
	# assert_instance_of time, time.new
 #  end

 #  def test_status
	# assert_instance_of status, status.new
 #  end
end
