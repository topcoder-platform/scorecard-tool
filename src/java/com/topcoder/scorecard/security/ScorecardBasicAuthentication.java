/*
 * Copyright (C) 2017 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.scorecard.security;

import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.BasicAuthentication;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Custom Authentication for standalone scorecard tool app
 * This removed some dependencies on ejbs
 *
 */
public class ScorecardBasicAuthentication extends BasicAuthentication {

    private static Logger log = Logger.getLogger(ScorecardBasicAuthentication.class);

    private final String SQL_GET_USER_BY_ID = "SELECT user_id FROM security_user WHERE login_id = ?";

    public ScorecardBasicAuthentication(Persistor userPersistor, TCRequest request, TCResponse response) throws Exception {
        super(userPersistor, request, response, MAIN_SITE);
    }

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request, response and cookie path resource.
     *
     * @param userPersistor
     * @param request
     * @param response
     * @param r
     * @throws Exception
     */
    public ScorecardBasicAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, Resource r) throws Exception {
        super(userPersistor, request, response, MAIN_SITE, null);
    }

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request and response.
     *
     * @param userPersistor
     * @param request
     * @param response
     * @param dataSource
     * @throws Exception
     */
    public ScorecardBasicAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, String dataSource) throws Exception {
        super(userPersistor, request, response, MAIN_SITE, dataSource);
    }

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request, response and cookie path resource.
     *
     * @param userPersistor
     * @param request
     * @param response
     * @param r
     * @param dataSource
     * @throws Exception
     */
    public ScorecardBasicAuthentication(Persistor userPersistor, TCRequest request, TCResponse response, Resource r, String dataSource) throws Exception {
        super(userPersistor, request, response, r, dataSource);
    }

    /**
     * Create user object from provide user Id
     *
     * @param userId
     * @return user
     */
    protected User makeUser(long userId){
        log.info("entering ScorecardBasicAuthentication#makeUSer with user id = " + userId);
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        try {
            connection = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
            ps = connection.prepareStatement(SQL_GET_USER_BY_ID);
            ps.setLong(1, userId);
            rs = ps.executeQuery();
            if (rs.next()){
                return new SimpleUser(userId, rs.getString(1), "");
            } else {
                return SimpleUser.createGuest();
            }
        } catch (SQLException e) {
            log.error("Fail to get user with user id = " + userId);
            return SimpleUser.createGuest();
        } finally {
            log.info("exit ScorecardBasicAuthentication#makeUSer with user id = " + userId);
            DBMS.close(rs);
            DBMS.close(ps);
            DBMS.close(connection);
        }
    }
}
