# PopCornMovies

The backend for a movie system.

### Setting up the API backend

To set this up, there are 2 things required.

1. In Config, set the `base_url` and `frontend_url` parameters (requires a trailing slash)
2. Add the database content from [`database/*.sql`](database/)
3. Open the app to the location you set.

The config parameters are near the top and look like:

```
$config['base_url'] = 'http://localhost/PopCornMovies/';
$config['frontend_url'] = 'http://localhost/PopCornFrontend/';
```