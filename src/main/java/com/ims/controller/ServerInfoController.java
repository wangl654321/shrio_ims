package com.ims.controller;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.env.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.StandardServletEnvironment;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/***
 *
 *
 * 描    述：
 *
 * 创 建 者： @author wl
 * 创建时间： 2019/4/8 13:11
 * 创建描述：
 *
 * 修 改 者：
 * 修改时间：
 * 修改描述：
 *
 * 审 核 者：
 * 审核时间：
 * 审核描述：
 *
 */
@Controller
public class ServerInfoController implements EnvironmentAware {

    protected Logger logger = LogManager.getLogger(this.getClass());

    private Properties properties = null;

    /**
     * 操作系统及服务器信息
     */
    private final String PROPERTIES_KEY = "systemProperties";

    /**
     * 指定需要获取的信息key
     */
    private String defaultPropertiesKey = "";


    /**
     * 获取环境信息
     */
    private Environment environment = null;

    /**
     * 获取服务器时间（前台获取）
     *
     * @return
     */
    @GetMapping("/ServerTimeQT")
    public String ServerTimeQT() {
        return "module/time";
    }

    /**
     * 获取服务器时间（后台获取）
     *
     * @param model
     * @return
     */
    @GetMapping("/ServerTimeHT")
    public String ServerTimeHT(Model model) {

        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("Y-MM-dd hh:mm:ss ms");
        String time = sdf.format(now);
        model.addAttribute("time", time);
        return "time";
    }


    @Override
    public void setEnvironment(Environment environment) {
        this.environment = environment;
    }

    public String getDefaultPropertiesKey() {
        return defaultPropertiesKey;
    }

    public void setDefaultPropertiesKey(String defaultPropertiesKey) {
        this.defaultPropertiesKey = defaultPropertiesKey;
    }

    private StandardServletEnvironment getStandardServletEnvironment() {
        StandardServletEnvironment standardServletEnvironment = (StandardServletEnvironment) environment;
        return standardServletEnvironment;
    }

    private MutablePropertySources getMutablePropertySources() {
        MutablePropertySources mutablePropertySources = getStandardServletEnvironment().getPropertySources();
        return mutablePropertySources;
    }

    /**
     * MutablePropertySources 里面定义了一个PropertySourcesList 这里只取其中一个
     *
     * @return
     */
    private PropertySource getPropertySource() {
        String propertiesName = getDefaultPropertiesKey();
        if (StringUtils.isBlank(propertiesName)) {
            throw new RuntimeException("please set default properties key....");
        }
        PropertySource systemProperties = getMutablePropertySources().get(propertiesName);
        return systemProperties;
    }

    /**
     * 获取到的信息封装到Properties当中
     * @return
     */
    private Properties getProperties() {
        Properties properties = (Properties) getPropertySource().getSource();

        return properties;
    }

    /**
     * 通过key 具体获取某一项的值如：传入os.name获取当前系统版本信息
     * @param key
     * @return
     */
    private String getSystemConfigInfo(String key) {
        properties = getProperties();
        String value = properties.get(key) + "";
        return value;
    }


    @RequestMapping("/serverInfo")
    public ModelAndView serverInfo() {

        ModelAndView mav = new ModelAndView("module/serverInfo");

        //获取服务器信息、操作系统信息、客户端信息
        Map<String, Object> map = new HashMap<String, Object>();
        setDefaultPropertiesKey(PROPERTIES_KEY);
        Properties properties = getProperties();
        for (Object key : properties.keySet()) {
            map.put(key.toString(), properties.get(key));
        }
        mav.addObject("map", map);

        //获取java内存信息
        Runtime runtime = Runtime.getRuntime();
        long freeMemoery = runtime.freeMemory();
        long totalMemory = runtime.totalMemory();
        long usedMemory = totalMemory - freeMemoery;
        long maxMemory = runtime.maxMemory();
        long useableMemory = maxMemory - totalMemory + freeMemoery;
        mav.addObject("usedMemory", usedMemory);
        mav.addObject("maxMemory", maxMemory);
        mav.addObject("useableMemory", useableMemory);
        return mav;
    }

}
