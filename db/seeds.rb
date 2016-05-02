Job.create!([
  {project_id: 1, resource_id: 1, start_date: "2014-10-13", end_date: "2015-01-02"},
  {project_id: 2, resource_id: 2, start_date: "2014-10-13", end_date: "2014-11-28"},
  {project_id: 1, resource_id: 2, start_date: "2014-10-15", end_date: "2014-11-06"}
])
Project.create!([
  {name: "Project 1", department: "dev", color: "#3737d6", status: true},
  {name: "Project 2", department: "dev", color: "#24d656", status: true}
])
Resource.create!([
  {name: "Developer 1", department: "dev", color: "#af00db"},
  {name: "Developer 2", department: "dev", color: "#1de0b2"}
])
