#Criação do banco de dados 
resource "google_sql_database_instance" "bvcloudsql" {
  database_version = "MYSQL_5_7"
  region           = "${var.region}"
  project     = "${var.project}"
  deletion_protection = false

  settings {
    tier = "${var.tier_sql}"
  }
}
#Criação do usuário
resource "google_sql_user" "users" {
  name     = "${var.name_user}"
  instance = google_sql_database_instance.bvcloudsql.name
  host     = "${var.host}"
  password = "${var.password}"
}