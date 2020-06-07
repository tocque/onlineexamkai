export const toForm = function(obj) {
    return Object.entries(obj).map(([k, v]) => k+'='+v).join('&');
}