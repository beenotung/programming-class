function pop(s: string): string {
    return s.substr(0, s.length - 1);
}

function last(s: string): string {
    return s[s.length - 1];
}

class Map<K, V> {
    o = {};

    has(k: K): boolean {
        return k in this.o;
    }

    get(k: K): V {
        return this.o[k];
    }

    set(k: K, v: V) {
        this.o[k] = v;
    }

    getMap(k: K): V {
        if (k in this.o) {
            return this.o[k];
        }
        const res = new Map();
        this.o[k] = res;
        return res;
    }
}

const cache = new Map<string, Map<string, number>>();

export function editDistance(a: string, b: string) {
    if (a.length === 0) {
        return b.length;
    }
    if (b.length === 0) {
        return a.length;
    }
    let res = cache.getMap(a).get(b);
    if (res !== undefined) {
        return res;
    }
    res = Math.min(
        editDistance(pop(a), pop(b)) + (last(a) === last(b) ? 1 : 0)
        , editDistance(pop(a), b) + 1
        , editDistance(a, pop(b)) + 1
    );
    cache.getMap(a).set(b, res);
    return res;
}
