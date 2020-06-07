import SvgIcon from '../components/SvgIcon/index.vue'// svg component

// register globally
Vue.component('svg-icon', SvgIcon)

const svgs = [
    '404.svg',           'bug.svg',             'chart.svg',
    'clipboard.svg',     'component.svg',       'dashboard.svg',
    'documentation.svg', 'drag.svg',            'edit.svg',
    'education.svg',     'email.svg',           'example.svg',
    'excel.svg',         'exit-fullscreen.svg', 'eye-open.svg',
    'eye.svg',           'form.svg',            'fullscreen.svg',
    'guide.svg',         'icon.svg',            'international.svg',
    'language.svg',      'link.svg',            'list.svg',
    'lock.svg',          'message.svg',         'money.svg',
    'nested.svg',        'password.svg',        'pdf.svg',
    'people.svg',        'peoples.svg',         'qq.svg',
    'search.svg',        'shopping.svg',        'size.svg',
    'skill.svg',         'star.svg',            'tab.svg',
    'table.svg',         'theme.svg',           'tree-table.svg',
    'tree.svg',          'user.svg',            'wechat.svg',
    'zip.svg'
]

const carrier = document.createElement('div');
carrier.innerHTML = /* HTML */`<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="position: absolute; width: 0; height: 0" id="__SVG_SPRITE_NODE__"></svg>`;
const svgsource = carrier.firstElementChild;
Promise.all(svgs.map((e) => {
    return axios.get("http://localhost:8080/OnlineExam/resources/icons/svg/"+e).then(({ data }) => [e, data]);
})).then((deps) => {
    svgsource.innerHTML = deps.map(([e, s]) => {
        return `<symbol xmlns="http://www.w3.org/2000/svg" id="icon-${e.slice(0, -4)}" ${s.replace(/width="(\d+)" height="(\d+)"/, (all, w, h) => 'viewBox="0 0 '+w+' '+h+'"').slice(4, -4)}symbol>`
    }).join('');
})
document.body.appendChild(svgsource);
