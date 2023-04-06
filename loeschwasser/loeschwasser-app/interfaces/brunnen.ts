export default interface IBrunnen {
    lat: number,
    lon: number,
    data: {
        adresse: string,
        standort: string,
        art: string,
        zugang: string,
        zufahrt: boolean,
        beschaedigt: boolean,
        absperrbar: boolean,
        schild: boolean,
        eisfrei: boolean,
        leistung: number,
        entlueftungszeit: number,
        bemerkung: string | null
    }
}