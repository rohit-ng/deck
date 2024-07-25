# Deck Configuration Repository

## Directory Structure

All teams should follow the structure outlined below for defining services, routes, plugins, and other configurations:

```plaintext
kong-config/
└── teams
    ├── team1
    │   ├── plugins
    │   │   └── plugin1.yml
    │   └── services
    │       └── service1
    │           └── routes
    │               └── route1.yml
    └── team2
        ├── plugins
        │   └── plugin1.yml
        └── services
            └── service1
                └── routes
                    └── route1.yml
```

### Details

- **teams/**: This directory contains subdirectories for each team.
  - **team1/**, **team2/**: Directories for individual teams. Each team manages its own set of services and plugins.
    - **services/**: Contains directories for each service managed by the team.
      - **service1/**: Directories for individual services.
        - **routes/**: Contains route definitions for the service.
          - **route1.yml**: Files defining individual routes.
    - **plugins/**: Contains plugin configurations specific to the team.
      - **plugin1.yml**: Files defining individual plugins.
