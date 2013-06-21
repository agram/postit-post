module ApplicationHelper
  def fix_url(str)
    str.starts_with?("http://") ? str : "http://#{str}"
  end

  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M%P") # format 21/06/2013 5:25pm
  end
end
