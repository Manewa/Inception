**README.md**

*This project has been created as part of the 42 curriculum by namalier.*

**Inception**

**Description**

Inception is a system administration and containerization project from the 42 curriculum. The goal of the project is to build a secure and modular infrastructure using Docker and Docker Compose.

The infrastructure is composed of multiple isolated containers communicating through a dedicated Docker network:

NGINX with TLSv1.2 / TLSv1.3
WordPress with PHP-FPM
MariaDB

Each service runs inside its own container and persists data using Docker volumes.

**INSTRUCTIONS**

Configure environment variables:

Edit the .env file in srcs.

Build the infrastrcuture
* 	make

Stop the infrastructure
* 	make down
	
Clean everything, including local data :
*	make fclean

**Virtual Machine vs Docker**

The Virtual machine :
- Full operating system required (OS)
- Heavy
- Slower startup
- Higher ressource usage

Docker :
- Shared kernel
- Light and easier to use
- Fast startup
- Lower ressources usage

**Secrets vs environment variables**

Secrets :
- More secure
- Hidden from process list
- Can be gitignored easily

Environment variables :
- Easier to configure
- Visible in environment
- Common in development

**Docker Network vs Local Network**

Docker Network :
- Isolated Containers
- Internal DNS

Host Network :
- Shares host network
- No isolation
- Faster access

**Resources & Documentation**
Docker Documentation
Docker Compose Documentation
NGINX Documentation
MariaDB Documentation
WordPress Documentation
PHP-FPM Documentation
Tutorial (GRADEME)
Docker networking tutorials
TLS/SSL tutorials
WordPress CLI tutorials
AI Usage

AI was used for:

understanding Docker concepts
debugging networking issues
understanding PHP-FPM and FastCGI
improving documentation structure
clarifying Linux and Docker commands

AI assistance was used as a learning and debugging support tool, same as correcting this readme.
