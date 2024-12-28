# Discord Whitelist Bot

A powerful Discord bot designed to manage whitelisting for FiveM servers through Discord. This bot provides seamless integration between your Discord server and FiveM server for managing player access.

## Features

- **Whitelist Management:**
  - Add/remove players from whitelist
  - Bulk whitelist management
  - Temporary whitelist options
  - Whitelist status checking

- **Integration:**
  - FiveM server integration
  - MySQL database support
  - Discord role synchronization
  - Real-time updates

- **Administration:**
  - Admin commands
  - Whitelist logs
  - User verification
  - Permission management

- **User Features:**
  - Self-whitelist capability
  - Status checking
  - Automatic notifications
  - Custom verification process

## Prerequisites

- Node.js v16.9.0 or higher
- MySQL Server
- Discord Bot Token
- FiveM Server
- Basic understanding of Discord bot hosting

## Installation

1. Clone the repository:
```bash
git clone https://github.com/laggis/Discord-Whitelist.git
cd Discord-Whitelist
```

2. Install dependencies:
```bash
npm install
```

3. Set up the database:
- Create a MySQL database
- Import the provided SQL schema
- Configure database connection in config

4. Configure the bot:
- Rename `config.example.js` to `config.js`
- Add your bot token and other settings

5. Start the bot:
```bash
node index.js
```

## Configuration

Example `config.js`:
```javascript
module.exports = {
    // Bot Configuration
    token: 'YOUR_BOT_TOKEN',
    prefix: '!',
    
    // Database Configuration
    database: {
        host: 'localhost',
        user: 'root',
        password: 'password',
        database: 'whitelist_db'
    },
    
    // FiveM Configuration
    fivem: {
        serverIP: 'your-server-ip',
        serverPort: '30120'
    },
    
    // Discord Settings
    roles: {
        admin: 'ROLE_ID',
        moderator: 'ROLE_ID',
        whitelisted: 'ROLE_ID'
    },
    
    // Channels
    channels: {
        whitelist: 'CHANNEL_ID',
        logs: 'CHANNEL_ID'
    }
};
```

## Commands

### Admin Commands
- `!whitelist add <steam_hex> [reason]` - Add player to whitelist
- `!whitelist remove <steam_hex> [reason]` - Remove player from whitelist
- `!whitelist check <steam_hex>` - Check whitelist status
- `!whitelist list` - List all whitelisted players
- `!whitelist reload` - Reload whitelist from database

### User Commands
- `!status` - Check personal whitelist status
- `!register <steam_hex>` - Request whitelist access
- `!help` - Show available commands

### Moderator Commands
- `!pending` - View pending whitelist requests
- `!approve <user_id>` - Approve whitelist request
- `!deny <user_id> [reason]` - Deny whitelist request

## Database Structure

```sql
CREATE TABLE whitelist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    discord_id VARCHAR(255),
    steam_hex VARCHAR(255),
    added_by VARCHAR(255),
    added_at TIMESTAMP,
    reason TEXT,
    status ENUM('active', 'inactive', 'pending')
);

CREATE TABLE whitelist_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(255),
    performed_by VARCHAR(255),
    target_hex VARCHAR(255),
    timestamp TIMESTAMP,
    details TEXT
);
```

## Integration with FiveM

Add to your server.cfg:
```cfg
exec whitelist.cfg
set mysql_connection_string "server=localhost;database=whitelist_db;userid=root;password=password"
```

## Events and Logging

The bot logs various events:
- Whitelist additions/removals
- Access attempts
- Configuration changes
- Error events
- User requests

## Troubleshooting

Common issues and solutions:

1. **Database Connection Issues:**
   - Verify database credentials
   - Check MySQL server status
   - Confirm database exists

2. **FiveM Integration Problems:**
   - Verify server connection details
   - Check permissions
   - Confirm whitelist is enforced

3. **Discord Bot Issues:**
   - Verify bot token
   - Check required permissions
   - Ensure proper role hierarchy

## Contributing

Contributions are welcome! Here's how:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Planned Features

- Web interface for management
- Advanced filtering options
- Automated verification system
- API integration
- Extended logging capabilities

## Support

Need help?
1. Check the [Issues](https://github.com/laggis/Discord-Whitelist/issues) page
2. Create a new issue with detailed information
3. Include error messages and steps to reproduce

## Security

- Regular security updates
- Encrypted data storage
- Role-based access control
- Audit logging
- Rate limiting

## Best Practices

1. **Regular Maintenance:**
   - Keep bot and dependencies updated
   - Regular database backups
   - Monitor log files
   - Clean old entries

2. **Access Control:**
   - Limit admin access
   - Regular permission audits
   - Strong password policies
   - Monitor suspicious activity

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Credits

Created by Laggis

## Notes

- Regular backups recommended
- Monitor Discord API changes
- Keep whitelist synchronized
- Test in development environment first
