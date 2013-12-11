describe "beaver" do
  describe_recipe "beaver_test::default" do
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources
    it "should have python installed" do
      package("python").must_be_installed
    end
    it "should have /opt/beaver" do
      directory("/opt/beaver").must_exist
    end
    it "should have a configuration file" do
      file("/etc/beaver.conf").must_exist
    end
    it "should be running" do
      service("beaver").must_be_running
    end
  end
end
