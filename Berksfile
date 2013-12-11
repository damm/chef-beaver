site :opscode

metadata

cookbook "python"
cookbook "git"
cookbook "build-essential"
cookbook "runit"

group :integration do
  cookbook "apt"
  cookbook "yum"
  cookbook "minitest-handler"
  cookbook "beaver_test", path: "test/cookbooks/beaver_test"
end
