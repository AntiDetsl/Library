using Library.DAL.Interfaces;
using Library.Entities;
using System.Data.SqlClient;
using System.Data;

namespace Library.DAL
{
    public class UserDAO : IUserDAO
    {
        private readonly string _connectionString = "Data Source=.;Initial Catalog = LibraryDB; Integrated Security = True;";

        public Guid Add(User user)
        {
            user.ID = AddToDB(user);

            foreach (Role role in user.Roles)
            {
                AddRoleToUser(user.ID, role);
            }

            return user.ID;
        }

        public bool IsAllowed(Action actionName, string userName)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "IsAllowed";

                command.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@ActionName",
                    SqlDbType = SqlDbType.NVarChar,
                    Direction = ParameterDirection.Input,
                    Value = actionName.ToString()
                });

                command.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@UserName",
                    SqlDbType = SqlDbType.NVarChar,
                    Direction = ParameterDirection.Input,
                    Value = userName
                });

                var isAllowed = new SqlParameter
                {
                    ParameterName = "@IsAllowed",
                    SqlDbType = SqlDbType.Bit,
                    Direction = ParameterDirection.Output,
                };

                command.Parameters.Add(isAllowed);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch
                {
                    throw new Exception("Book deletion failed");
                }

                return (bool)isAllowed.Value;
            }
        }

        public Guid AddToDB(User user)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;

                command.CommandText = "AddUser";

                command.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@Name",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = user.Name,
                    Direction = ParameterDirection.Input
                });

                command.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@Email",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = user.Email,
                    Direction = ParameterDirection.Input
                });

                command.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@Password",
                    SqlDbType = SqlDbType.VarBinary,
                    Value = user.Password,
                    Direction = ParameterDirection.Input
                });

                var id = new SqlParameter
                {
                    ParameterName = "@ID",
                    SqlDbType = SqlDbType.UniqueIdentifier,
                    Direction = ParameterDirection.Output
                };

                command.Parameters.Add(id);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch
                {
                    throw new Exception("Adding user to database failed");
                }
                return (Guid)id.Value;
            }
        }

        public void AddRoleToUser(Guid userID, Role role)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;

                command.CommandText = "AddRoleToUser";

                command.Parameters.Add(new SqlParameter
                {
                    ParameterName = "@UserID",
                    SqlDbType = SqlDbType.UniqueIdentifier,
                    Value = userID,
                    Direction = ParameterDirection.Input
                });

                command.Parameters.Add(new SqlParameter
                {
                    ParameterName = "RoleName",
                    SqlDbType = SqlDbType.NVarChar,
                    Value = role.ToString(),
                    Direction = ParameterDirection.Input
                });

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch
                {
                    throw new Exception("Adding role to user failed");
                }
            }
        }

        public IEnumerable<User> GetAll()
        {
            List<User> users = new List<User>();

            using (var connection = new SqlConnection(_connectionString))
            {
                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetAllUsers";

                connection.Open();
                var reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var user = new User((string)reader["Name"], (string)reader["Email"], (byte[])reader["Password"]);
                    user.ID = (Guid)reader["ID"];

                    users.Add(user);
                }
            }
            return users;
        }
    }

    public enum Action
    {
        GetAll,
        Add,
        Delete
    }
}
