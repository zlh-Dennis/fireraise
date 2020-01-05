package com.fireraise.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {

    //这里定义了一个变量，用于引用一会生成的会话工厂
    private static SessionFactory sessionFactory;
    
    //这里用了静态代码块创建会话工厂对象，这里用了单例模式
    static {
        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure() // configures settings from hibernate.cfg.xml
                .build();
        try {
            sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
        } catch (Exception e) {
            // The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
            // so destroy it manually.
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }
    
    //获取会话工厂是为了生产会话，所以不妨直接添加一个方法，用于获取会话对象
    public static Session getSession() {
        //调用会话工厂的openSession()获取一个会话，相当于一个连接，用于操作Hibernate数据库
        return sessionFactory.openSession();
    }

    //再添加一个方法，用于关闭会话,传入你要关闭的会话
    public static void close(Session session) {
        //如果会话对象不为null，且会话是打开的，我们将其关闭
        if (null != session && session.isOpen()) {
            session.close();
        }
    }
}