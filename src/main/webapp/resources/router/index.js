/* Layout */
import Layout from '../layout/index.vue'

/* Router Modules */
// import componentsRouter from './modules/components'
// import chartsRouter from './modules/charts'
// import tableRouter from './modules/table'
// import nestedRouter from './modules/nested'

/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'             the icon show in the sidebar
    noCache: true                if set true, the page will no be cached(default is false)
    affix: true                  if set true, the tag will affix in the tags-view
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  // {
  //   path: '/404',
  //   component: () => import('../../resources/error-page/404'),
  //   hidden: true
  // },
  // {
  //   path: '/401',
  //   component: () => import('../../resources/error-page/401'),
  //   hidden: true
  // },
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [
      {
        path: 'dashboard',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/dashboard/index.vue').then(m => m.default),
        name: 'Dashboard',
        meta: { title: '主页', icon: 'dashboard', affix: true }
      }
    ]
  },
  // {
  //   path: '/documentation',
  //   component: Layout,
  //   children: [
  //     {
  //       path: 'index',
  //       component: () => AMEF.import('../../resources/documentation/index.vue'),
  //       name: 'Documentation',
  //       meta: { title: 'Documentation', icon: 'documentation', affix: true }
  //     }
  //   ]
  // },
  // {
  //   path: '/guide',
  //   component: Layout,
  //   redirect: '/guide/index',
  //   children: [
  //     {
  //       path: 'index',
  //       component: () => AMEF.import('../../resources/guide/index.vue'),
  //       name: 'Guide',
  //       meta: { title: 'Guide', icon: 'guide', noCache: true }
  //     }
  //   ]
  // },
  {
    path: '/profile',
    component: Layout,
    redirect: '/profile/index',
    hidden: true,
    roles: ["学生"],
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/profile/index.vue').then(m => m.default),
        name: 'Profile',
        meta: { title: '我的', icon: 'user', noCache: true }
      }
    ]
  }
]

/**
 * asyncRoutes
 * the routes that need to be dynamically loaded based on user roles
 */
export const asyncRoutes = [
  {
    path: '/permission',
    component: Layout,
    redirect: '/permission',
    alwaysShow: true, // will always show the root menu
    name: '授权设置',
    meta: {
      title: '授权设置',
      icon: 'lock',
      roles: ['管理员'] // you can set roles in root nav
    },
    children: [
      {
        path: 'page',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '菜单管理',
        meta: {
          title: 'Page',
          path: '../admin/menu/list',
          roles: ['管理员'] // or you can only set roles in sub nav
        }
      },
      // {
      //   path: 'directive',
      //   component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
      //   name: '用户管理',
      //   meta: {
      //     title: '用户管理',
      //     path: '../admin/user/list',
      //     // if do not set roles, means: this page does not require permission
      //   }
      // },
      {
        path: 'role',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '角色管理',
        meta: {
          title: '角色管理',
          path: '../admin/role/list',
          roles: ['管理员']
        }
      },
    ]
  },

  {
    path: '/log',
    component: Layout,
    name: '系统日志',
    meta: {
      title: '系统日志',
      icon: 'lock',
      roles: ['管理员'] // you can set roles in root nav
    },
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '日志列表',
        meta: {
          title: '系统日志',
          path: '../admin/log/list',
          roles: ['管理员']
        }
      }
    ]
  },

  {
    path: '/subject',
    component: Layout,
    name: '学科管理',
    meta: {
      title: '学科管理',
      icon: 'lock',
      roles: ['管理员'] // you can set roles in root nav
    },
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '学科列表',
        meta: {
          title: '学科列表',
          path: '../admin/subject/list',
          roles: ['管理员']
        }
      }
    ]
  },

  {
    path: '/user',
    component: Layout,
    name: '用户管理',
    meta: {
      title: '用户管理',
      icon: 'lock',
      roles: ['管理员'] // you can set roles in root nav
    },
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '用户列表',
        meta: {
          title: '用户列表',
          path: '../admin/user/list',
          roles: ['管理员']
        }
      }
    ]
  },

  {
    path: '/question',
    component: Layout,
    name: '试题管理',
    meta: {
      title: '试题管理',
      icon: 'lock',
      roles: ['管理员', '教师'] // you can set roles in root nav
    },
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '试题列表',
        meta: {
          title: '试题列表',
          path: '../admin/question/list',
        }
      }
    ]
  },

  {
    path: '/exam',
    component: Layout,
    name: '考试管理',
    meta: {
      title: '考试管理',
      icon: 'lock',
      roles: ['管理员', '教师'] // you can set roles in root nav
    },
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '考试列表',
        meta: {
          title: '考试列表',
          path: '../admin/exam/list',
        }
      }
    ]
  },

  {
    path: '/paper',
    component: Layout,
    name: '试卷管理',
    meta: {
      title: '试卷管理',
      icon: 'lock',
      roles: ['管理员', '教师'] // you can set roles in root nav
    },
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '试卷列表',
        meta: {
          title: '试卷列表',
          path: '../admin/examPaper/list',
        }
      }
    ]
  },

  {
    path: '/answer',
    component: Layout,
    name: '答题管理',
    meta: {
      title: '答题管理',
      icon: 'lock',
      roles: ['管理员', '教师'] // you can set roles in root nav
    },
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '答题列表',
        meta: {
          title: '答题列表',
          path: '../admin/examPaperAnswer/list',
          roles: ['管理员']
        }
      }
    ]
  },

  {
    path: '/stat',
    component: Layout,
    name: '成绩统计',
    meta: {
      title: '答题管理',
      icon: 'lock',
      roles: ['管理员', '教师'] // you can set roles in root nav
    },
    children: [
      {
        path: 'index',
        component: () => AMEF.import(window.APP_PATH+'/resources/views/guide/index.vue').then(m => m.default),
        name: '统计图表',
        meta: {
          title: '统计图表',
          path: '../admin/stats/list',
        }
      }
    ]
  },

  // {
  //   path: '/tab',
  //   component: Layout,
  //   children: [
  //     {
  //       path: 'index',
  //       component: () => import('@/views/tab/index'),
  //       name: 'Tab',
  //       meta: { title: 'Tab', icon: 'tab' }
  //     }
  //   ]
  // },

  // {
  //   path: '/error',
  //   component: Layout,
  //   redirect: 'noRedirect',
  //   name: 'ErrorPages',
  //   meta: {
  //     title: 'Error Pages',
  //     icon: '404'
  //   },
  //   children: [
  //     {
  //       path: '401',
  //       component: () => import('@/views/error-page/401'),
  //       name: 'Page401',
  //       meta: { title: '401', noCache: true }
  //     },
  //     {
  //       path: '404',
  //       component: () => import('@/views/error-page/404'),
  //       name: 'Page404',
  //       meta: { title: '404', noCache: true }
  //     }
  //   ]
  // },

  // {
  //   path: '/error-log',
  //   component: Layout,
  //   children: [
  //     {
  //       path: 'log',
  //       component: () => import('@/views/error-log/index'),
  //       name: 'ErrorLog',
  //       meta: { title: 'Error Log', icon: 'bug' }
  //     }
  //   ]
  // },
  // // 404 page must be placed at the end !!!
  // { path: '*', redirect: '/404', hidden: true }
]

const createRouter = () => new VueRouter({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
