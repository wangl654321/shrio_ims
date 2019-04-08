package com.ims.util;

import java.io.InputStream;
import java.util.Enumeration;
import java.util.Properties;

public class PropertiesUtil {
    private static PropertiesUtil manager = null;
    private static Object managerLock = new Object();
    private Object propertiesLock = new Object();
    private static String DATABASE_CONFIG_FILE = "/path.properties";
    private Properties properties = null;

    public static PropertiesUtil getInstance() {
        if (manager == null) {
            synchronized (managerLock) {
                if (manager == null) {
                    manager = new PropertiesUtil();
                }
            }
        }
        return manager;
    }

    private PropertiesUtil() {
    }

    public static String getProperty(String name) {
        return getInstance()._getProperty(name);
    }

    private String _getProperty(String name) {
        initProperty();
        String property = properties.getProperty(name);
        if (property == null) {
            return "";
        } else {
            return property.trim();
        }
    }

    public static Enumeration<?> propertyNames() {
        return getInstance()._propertyNames();
    }

    private Enumeration<?> _propertyNames() {
        initProperty();
        return properties.propertyNames();
    }

    private void initProperty() {
        if (properties == null) {
            synchronized (propertiesLock) {
                if (properties == null) {
                    loadProperties();
                }
            }
        }
    }

    private void loadProperties() {
        properties = new Properties();
        InputStream in = null;
        try {
            in = getClass().getResourceAsStream(DATABASE_CONFIG_FILE);
            properties.load(in);
        } catch (Exception e) {
            System.err
                    .println("Error reading conf properties in PropertiesUtil.loadProps() "
                            + e);
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (Exception e) {
            }
        }
    }

    /**
     * 提供配置文件路径
     *
     * @param filePath
     * @return
     */
    public Properties loadProperties(String filePath) {
        Properties properties = new Properties();
        InputStream in = null;
        try {
            in = getClass().getResourceAsStream(filePath);
            properties.load(in);
        } catch (Exception e) {
            System.err
                    .println("Error reading conf properties in PropertiesUtil.loadProperties() "
                            + e);
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (Exception e) {
            }
        }
        return properties;
    }
}