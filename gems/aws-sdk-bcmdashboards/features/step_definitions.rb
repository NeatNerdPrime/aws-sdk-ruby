Before("@bcmdashboards") do
  @service = Aws::BCMDashboards::Resource.new
  @client = @service.client
end

After("@bcmdashboards") do
  # shared cleanup logic
end
