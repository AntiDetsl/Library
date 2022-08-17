namespace Library.Entities
{
    public class User
    {
        private Guid _id;
        private string _name;
        private string _email;
        private byte[] _password;
        private List<Role> _roles;

        public User(string name, string email, string password)
        {
            Name = name;
            Email = email;
            Password = System.Text.Encoding.UTF8.GetBytes(password);
            Roles = new List<Role>();
        }
        public User(string name, string email, byte[] password)
        {
            Name = name;
            Email = email;
            Password = password;
            Roles = new List<Role>();
        }

        public Guid ID { get => _id; set => _id = value; }
        public string Name { get => _name; set => _name = value; }
        public string Email
        {
            get => _email;
            set
            {
                if (ValidationHelper.IsValidEmail(value, out string message))
                {
                    _email = value;
                }
                else
                {
                    throw new Exception(message);
                }
            }
        }
        public byte[] Password { get => _password; set => _password = value; }
        public List<Role> Roles { get => _roles; set => _roles = value; }
    }
    public enum Role
    {
        User,
        Librarian,
        Admin
    }
}
