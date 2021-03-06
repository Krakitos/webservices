package etu.polytech.ws.soap.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by momo- on 17/09/2015.
 */
@Entity
@Table(name = "pays")
public class CountryEntity {
    @Id
    @Column(name = "NOM_PAYS")
    private String name;

    @Column(name = "NOM_CAPITALE")
    private String capital;

    @Column(name = "NB_HABITANTS")
    private long population;

    public CountryEntity() {}

    public CountryEntity(String name, String capital, long population) {
        this.name = name;
        this.capital = capital;
        this.population = population;
    }

    public String getName() {
        return name;
    }

    public String getCapital() {
        return capital;
    }

    public long getPopulation() {
        return population;
    }

    @Override
    public String toString() {
        return "CountryEntity{" +
                "getName='" + name + '\'' +
                ", getCapital='" + capital + '\'' +
                ", getPopulation=" + population +
                '}';
    }
}
