dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            // url = "jdbc:hsqldb:mem:devDB"
            // dbCreate = "create-drop"

            driverClassName = "org.postgresql.Driver"
            url = System.getenv("TCS_CATALOG_URL")
            username = System.getenv("TCS_CATALOG_USERNAME")
            password = System.getenv("TCS_CATALOG_PASSWORD")
        }
    }
    test {
        dataSource {
            // Please DONOT change the data source for test environment because the review table in production database has
            // many foreign keys
            dbCreate = "create-drop"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            driverClassName = "org.postgresql.Driver"
            url = System.getenv("TCS_CATALOG_URL")
            username = System.getenv("TCS_CATALOG_USERNAME")
            password = System.getenv("TCS_CATALOG_PASSWORD")
        }
    }
}
