package org.xxx.netctoss.entity;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by JEWELZ on 16/6/15.
 */

public class PrivilegeReader {

    private static List<Privilege> modules = new ArrayList<Privilege>();

    static {
        InputStream xml = PrivilegeReader.class.getClassLoader().getResourceAsStream("org/xxx/netctoss/config/privileges.xml");
        modules = toModuleList(xml);
    }

    /**
     * 返回XML中所有权限数据
     *
     * @return
     */
    public static List<Privilege> getModules() {
        return modules;
    }

    /**
     * 根据权限ID返回权限名
     *
     * @param id
     * @return
     */
    public static String getModuleNameById(String id) {
        List<Privilege> modules = getModules();
        for (Privilege module : modules) {
            if (module.getId().equals(id)) {
                return module.getName();
            }
        }
        return "";
    }

    public static List<String> getUrlsById(String id) {
        List<Privilege> modules = getModules();
        List<String> urls = new ArrayList<>();
        modules.stream().filter(module -> module.getId().equals(id)).forEach(module -> {
            urls.addAll(module.getUrls().stream().collect(Collectors.toList()));
        });
        return urls;
    }

    @SuppressWarnings("unchecked")
    //解析privileges.xml文件
    protected static List<Privilege> toModuleList(InputStream xml) {

        List<Privilege> modules = new ArrayList<>();

        try {
            SAXReader reader = new SAXReader();
            Document doc = reader.read(xml);
            Element root = doc.getRootElement();

            List<Element> moduleElements = root.elements("privilege");

            for (Element moduleElement : moduleElements) {

                Privilege module = new Privilege();

                module.setId(moduleElement.attributeValue("id"));
                module.setName(moduleElement.elementText("name"));

                Element urlElement = moduleElement.element("urls");
                List<Element> urlElements = urlElement.elements();
                List<String> urls = new ArrayList<String>();

                for (Element element : urlElements) {
                    urls.add(element.getText());
                }
                module.setUrls(urls);

                modules.add(module);

            }

            return modules;

        } catch (DocumentException e) {
            e.printStackTrace();
            throw new RuntimeException("", e);
        }
    }

    public static void main(String[] args) {
        List<Privilege> list =
                PrivilegeReader.getModules();
        for (Privilege p : list) {
            System.out.println(p.getId() + " " + p.getName() + " " + p.getUrls());
        }
        System.out.println(PrivilegeReader.getModuleNameById("3"));
    }


}
